package edu.bit.ssmall.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.kakaopay.KakaoPay;
import edu.bit.ssmall.service.BuyService;
import edu.bit.ssmall.service.CartService;
import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.valid.PayValidator;
import edu.bit.ssmall.vo.CartViewVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.PayVO;
import edu.bit.ssmall.vo.ProductImageVO;

//장바구니 관련 컨트롤러
@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	KakaoPay kakaoPay;
	
	@Autowired
	BuyService buyService;
	
	@Autowired
	RegisterService registerService;
	
	@Autowired
	CartService cartService;
	
	//장바구니에 추가
	@RequestMapping(value = "addCart", method = {RequestMethod.POST,RequestMethod.GET})
	public String addCart(Model model, HttpServletRequest request, Principal principal) {
		System.out.println("addCart() 장바구니에 추가!");
		
		String p_number = request.getParameter("p_number"); //장바구니에 추가하려는 상품번호
		String b_amount = request.getParameter("b_amount"); //해당상품 구매갯수				
		String m_id = principal.getName(); //로그인한 사용자 id가져옴
		
		MemberVO memberVO = cartService.memberInfo(m_id); //id를 이용해서 해당회원 정보 가져옴
		ProductImageVO productImageVO = cartService.productInfo(p_number); //해당 상품번호 이용해서 이미지하나포함한 상품정보 가져옴
		
		System.out.println(productImageVO);
		int totalprice = productImageVO.getP_price() * Integer.parseInt(b_amount); //상품의 가격과 구매하려는 갯수를 곱해 총가격
		
		cartService.addCart(p_number, memberVO.getM_number(), b_amount, totalprice); //상품번호, 회원번호, 구매갯수, 총가격으로 카트테이블에 삽입

		return "redirect:/cart/cartView";				
	}
	
	//장바구니 탭 눌렀을 때 
	@RequestMapping(value = "cartView", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartView(Model model, Principal principal, HttpServletRequest request) {
		System.out.println("cartView() 장바구니 보기!");
		
		String m_id = principal.getName(); //로그인한 사용자 id가져옴
		MemberVO memberVO = cartService.memberInfo(m_id); //id를 이용해서 해당회원 정보 가져옴
		
		ArrayList<CartViewVO> cart = cartService.cartInfo(memberVO.getM_number()); //회원번호를 이용해서 카트에 담긴 정보를 담음
		System.out.println(cart);		
		
	
		model.addAttribute("cartList", cart); //카트에 담긴 모든물건들을 세션처리

		return "Cart/shopping-cart";				
	}
	
	//장바구니에서 구매할 물건 체크해서 구매하기
	@RequestMapping(value="cartBuy", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartBuy(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartBuy() 장바구니에서 체크해서 구매하기!");
		HttpSession session = request.getSession();		
	
		String[] check = request.getParameterValues("check"); //구매할 상품 체크한 수 받아옴. value는 체크한 카트아이디임
		
		
		if(check == null) {
			//체크한게 없으면 다시 장바구니로			
			session.setAttribute("checkNull", "checkNull");

			return "redirect:/cart/cartView";
		}
		
		int amount = 0; //구매하려는 총갯수
		int totalprice = 0; 
		//구매하려고 체크한거를 뽑아온다 arr[0]째의 cart테이블에서 정보를 뺴온다.
		//구매할 상품 사진 이름 구매수량 구매가격을 cartBuyView에 전달
		ArrayList<CartViewVO> cart = new ArrayList<CartViewVO>();
		
		for (int i = 0; i < check.length; i++) {
			CartViewVO item = cartService.cartByCid(check[i]); //체크한 카트아이디를 이용해서 정보뽑아냄 
			amount = amount + 1; // 계속 돌면서 체크된 수 만큼 갯수가 늘게함
			totalprice = totalprice + item.getC_grandtotal();
			cart.add(item); // 계속 돌면서 ArrayList에 담음
			System.out.println(item);
		}
		PayVO payVO = new PayVO();
		System.out.println(totalprice);
		
		session.setAttribute("cart", cart); // 구매하려는 상품들을 세션으로 저장
		session.setAttribute("amount", amount); //구매하려는 상품갯수을 세션으로 저장
		session.setAttribute("totalprice", totalprice); // 구매하려는 상품의 총가격을 세션으로 저장

		model.addAttribute("payVO",payVO); //구매할때 배송자 정보를 유효성 검사하기위해 payVO 객체를 넣어줌
		
		return "Cart/cartBuyView";
	}
	
	//카트에서 삭제버튼을 누르면 get방식으로 cid가넘어옴
	@RequestMapping(value="cartDelete", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartDelete(Model model, HttpServletRequest request) {
		System.out.println("cartDelete() 장바구니에서 해당 상품 삭제!");
	
		String c_id = request.getParameter("c_id");
		System.out.println("c_id");
		cartService.cartDelete(c_id); //해당 cid로 삭제
		
		return"redirect:/cart/cartView";
	}
	
	//장바구니에서 구매하기 누르고 나오는 창에서 주문정보값 받는곳
	@RequestMapping(value="cartPay", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartPay(Model model, PayVO payVO, Errors errors,HttpServletResponse response, HttpServletRequest request, Principal principal) throws Exception {
		System.out.println("cartPay() 해당상품 결제하기!");
		
		HttpSession session = request.getSession();
			
		//배송정보들
		String addr1 =request.getParameter("addr1");
		String addr2 =request.getParameter("addr2");
		String addr3 =request.getParameter("addr3");
		
		int result = registerService.check(addr1, addr2, addr3); //registerService에 주소 널값 확인 (NULL 이면 1 반환)	
		new PayValidator().validate(payVO, errors); //유효성검사
		
		if(result == 1 || errors.hasErrors()) {
			//주소가 널값이거나 에러가 발생한다면 정보다시 확인하라는 경고창 띄움
			System.out.println("에러발생");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('입력한 정보를 다시 확인하여 주세요!');</script>");			 
			out.flush();
			
			
			return "Cart/cartBuyView";
		}
		String adress = "(" + addr1 + ") " + addr2 + " " + addr3;		
		String totalprice = String.valueOf(session.getAttribute("totalprice")); 
		String amount =  String.valueOf(session.getAttribute("amount"));
		System.out.println(totalprice);
		System.out.println(amount);
		
		payVO.setAddr(adress);
		payVO.setTotalPrice(Integer.parseInt(totalprice));
		payVO.setAmount(amount);
		
		session.setAttribute("payVO",payVO); //구매정보를 담은 객체 세션처리.
		
		session.removeAttribute("totalprice"); //가격 수량 payVO로 세션처리햇으니 두개삭제
		session.removeAttribute("amount");
		
	
		ArrayList<CartViewVO> list = (ArrayList<CartViewVO>) session.getAttribute("cart");
		String p_name = "상승몰 장바구니 결제("; //상품이름
		
		for (int i = 0; i < list.size(); i++) {			
			System.out.println(list.get(i)); //제대로 담겼는지 확인
			p_name = p_name + cartService.getP_name(list.get(i).getP_number()) + ", ";
			
		}
		p_name = p_name + ")";
		
		//사용자정보
		String m_id = principal.getName(); //로그인한 사용자 id가져옴	
		session.setAttribute("p_name", p_name); //상품명들 세션처리
		
		String url = kakaoPay.kakaoPayReady(p_name,totalprice , amount, m_id, request); //에러가 있다면 null
		
		if(url == null) {
			System.out.println("url : "+url);
			return "redirect:/";
		}
		//결제창 띄우는 거임
		return "redirect:" + url;

	}
	
	

	
	
}
