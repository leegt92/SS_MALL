package edu.bit.ssmall.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

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

import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.page.PageMaker;
import edu.bit.ssmall.service.BuyService;
import edu.bit.ssmall.service.CartService;
import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.valid.PayValidator;
import edu.bit.ssmall.vo.CartViewVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.PayVO;
import edu.bit.ssmall.vo.ProductImageVO;

@Controller
public class CartController {
	
	@Autowired
	BuyService buyService;
	
	@Autowired
	RegisterService registerService;
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value = "addCart", method = {RequestMethod.POST,RequestMethod.GET})
	public String addCart(Model model, HttpServletRequest request, Principal principal) {
		System.out.println("addCart() 장바구니에 추가!");
		
		String p_number = request.getParameter("p_number"); //장바구니에 추가하려는 상품번호
		String b_amount = request.getParameter("b_amount"); //해당상품 구매갯수				
		String m_id = principal.getName(); //로그인한 사용자 id가져옴
		
		MemberVO memberVO = cartService.memberInfo(m_id);
		ProductImageVO productImageVO = cartService.productInfo(p_number);
		
		System.out.println(productImageVO);
		int totalprice = productImageVO.getP_price() * Integer.parseInt(b_amount);
		
		cartService.addCart(p_number, memberVO.getM_number(), b_amount, totalprice);
		
		ArrayList<CartViewVO> cart = cartService.cartInfo(memberVO.getM_number());
		System.out.println(cart);
		
		model.addAttribute("cart", cart);
		
		return "Cart/shopping-cart";				
	}
	
	@RequestMapping(value = "cartView", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartView(Model model, Principal principal, HttpServletRequest request) {
		System.out.println("cartView() 장바구니 보기!");
		
		String m_id = principal.getName(); //로그인한 사용자 id가져옴
		MemberVO memberVO = cartService.memberInfo(m_id);
		
		ArrayList<CartViewVO> cart = cartService.cartInfo(memberVO.getM_number());
		System.out.println(cart);
		model.addAttribute("cart",cart);
		
		HttpSession session = request.getSession();
		session.setAttribute("cartAll", cart);
		return "Cart/shopping-cart";				
	}
	
	@RequestMapping(value="cartBuy", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartBuy(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartBuy() 장바구니에서 체크해서 구매하기!");
		HttpSession session = request.getSession();		
		
		String totalprice = request.getParameter("totalprice");
		String[] arr = request.getParameterValues("check");
		System.out.println(arr);
		
		if(arr == null) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('선택한 상품이 없습니다.');</script>");			 
			out.flush();
			
			model.addAttribute("cart",session.getAttribute("cartAll"));
			return "Cart/shopping-cart";
		}
		int amount = 0; //구매하려는 총갯수
		
		//구매하려고 체크한거를 뽑아온다 arr[0]째의 cart테이블에서 정보를 뺴온다.
		//구매할 상품 사진 이름 구매수량 구매가격을 cartBuyView에 전달
		ArrayList<CartViewVO> cart = new ArrayList<CartViewVO>();
		
		for (int i = 0; i < arr.length; i++) {
			CartViewVO cartViewVO = cartService.cartByCid(arr[i]);
			amount = amount + 1; //체크박스에 체크된 수 만큼 갯수가 늘게함
			cart.add(cartViewVO);
		}
		PayVO payVO = new PayVO();
	
		session.setAttribute("cart", cart); // 구매하려는 상품들을 세션으로 저장
		session.setAttribute("amount", amount); //구매하려는 상품갯수을 세션으로 저장
		session.setAttribute("totalprice", totalprice); // 구매하려는 상품의 총가격을 세션으로 저장
		
		model.addAttribute("cart",cart); //구매하려는 상품들을 리스트로 넘겨줌
		model.addAttribute("payVO",payVO); //구매할때 배송자 정보를 유효성 검사하기위해 payVO 객체를 넣어줌
		return "Cart/cartBuyView";
	}
	
	@RequestMapping(value="cartDelete", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartDelete(Model model, HttpServletRequest request) {
		System.out.println("cartDelete() 장바구니에서 해당 상품 삭제!");
		
		
		String c_id = request.getParameter("c_id");
		System.out.println("c_id");
		cartService.cartDelete(c_id);
		
		return"redirect:/cartView";
	}
	
	@RequestMapping(value="cartPay", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartPay(Model model, PayVO payVO, Errors errors,HttpServletResponse response, HttpServletRequest request, Principal principal) throws Exception {
		System.out.println("cartPay() 해당상품 결제하기!");
		
		HttpSession session = request.getSession();
		//사용자정보
		String m_id = principal.getName(); //로그인한 사용자 id가져옴
				
		//배송정보들
		String addr1 =request.getParameter("addr1");
		String addr2 =request.getParameter("addr2");
		String addr3 =request.getParameter("addr3");
		
		int result = registerService.check(addr1, addr2, addr3); //registerService에 주소 널값 확인 (NULL 이면 1 반환)
		
		
		new PayValidator().validate(payVO, errors);
		
		if(result == 1 || errors.hasErrors()) {
			//주소가 널값이거나 에러가 발생한다면 정보다시 확인하라는 경고창 띄움
			System.out.println("에러발생");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('입력한 정보를 다시 확인하여 주세요!');</script>");			 
			out.flush();
			
			model.addAttribute("cart",session.getAttribute("cart"));
			return "Cart/cartBuyView";
		}
		String adress = "(" + addr1 + ") " + addr2 + " " + addr3;		
		payVO.setAddr(adress);
		
		System.out.println("오타없음 결제시작하기!");
	
		ArrayList<CartViewVO> list = (ArrayList<CartViewVO>) session.getAttribute("cart");
		
		for (int i = 0; i < list.size(); i++) {			
			System.out.println(list.get(i));
		}
		MemberVO memberVO = buyService.memberInfo(m_id); //해당 아이디의 정보를 가져옴
		
		
		model.addAttribute("email", memberVO.getM_email()); //이메일
		model.addAttribute("totalprice", session.getAttribute("totalprice")); // 상품총가격
		model.addAttribute("amount",session.getAttribute("amount")); // 총갯수	
		
		//장바구니에서 구매하겠다고 한녀석들 session.getAttribute해서 불러온거
		//여기안에는 구매하겠다는 카트의 정보가 리스트에 담겨있다. 
		model.addAttribute("product", list);
		model.addAttribute("payVO",payVO); //구매자 정보
		
		return "Cart/cartPayment";
	}
	
	@RequestMapping(value = "cartPaySuccess", method = { RequestMethod.POST, RequestMethod.GET} )
	public String cartPaySuccess(Model model, PayVO payVO, HttpServletRequest req) throws Exception {
		System.out.println("cartPaySuccess()");
		HttpSession session = req.getSession();
		ArrayList<CartViewVO> list = (ArrayList<CartViewVO>) session.getAttribute("cart");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			
			String c_id = list.get(i).getC_id();
			int p_number = list.get(i).getP_number();
			int m_number = list.get(i).getM_number();
			int b_amount= list.get(i).getC_amount();
			int b_totalprice = list.get(i).getC_grandtotal();
			cartService.cartBuy(p_number,m_number,b_amount,b_totalprice);
			cartService.cartDelete(c_id);
		}
		
		session.removeAttribute("cart");
		session.removeAttribute("amount");
		session.removeAttribute("totalprice");

		
		return "redirect:/";
	}
		
	@RequestMapping(value = "cartPayFail", method = { RequestMethod.POST, RequestMethod.GET} )
	public String cartPayFail(Model model,PayVO payVO,HttpServletResponse response, HttpServletRequest request) throws Exception {
		System.out.println("cartPayFail()");
		
		HttpSession session = request.getSession();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	
		out.println("<script>alert('다시 진행하여 주세요');</script>");			 
		out.flush();
		
		model.addAttribute("cart",session.getAttribute("cart"));

		return "Cart/cartBuyView";
	
	}
	
	
	@ResponseBody
	@RequestMapping("/miniCart")
	public ArrayList<CartViewVO> smallCart(Principal principal){
		
		
		return cartService.smallCartInfo(principal.getName());
	}
	
}
