package edu.bit.ssmall.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.service.BuyService;
import edu.bit.ssmall.service.CartService;
import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.vo.CartViewVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductImageVO;

//장바구니 관련 컨트롤러
@Controller
@RequestMapping("cart")
public class CartController {
	
	
	@Autowired
	BuyService buyService;
	
	@Autowired
	RegisterService registerService;
	
	@Autowired
	CartService cartService;
	
	//productDetail에서 장바구니에 추가
	@RequestMapping(value = "addCart", method = {RequestMethod.POST,RequestMethod.GET})
	public String addCart(Model model, HttpServletRequest request, Principal principal) {
		System.out.println("addCart() 장바구니에 추가!");
		HttpSession session = request.getSession();//세션 기본설정
		
		String p_number = request.getParameter("p_number"); //장바구니에 추가하려는 상품번호
		String b_amount = request.getParameter("b_amount"); //해당상품 구매갯수				
		String m_id = principal.getName(); //로그인한 사용자 id가져옴
		
		MemberVO memberVO = cartService.memberInfo(m_id); //id를 이용해서 해당회원 정보 가져옴
		ProductImageVO productImageVO = cartService.productInfo(p_number); //해당 상품번호 이용해서 이미지하나포함한 상품정보 가져옴
		
		System.out.println(productImageVO);
		int totalprice = productImageVO.getP_price() * Integer.parseInt(b_amount); //상품의 가격과 구매하려는 갯수를 곱해 총가격
		
		cartService.addCart(p_number, memberVO.getM_number(), b_amount, totalprice); //상품번호, 회원번호, 구매갯수, 총가격으로 카트테이블에 삽입
		
		session.setAttribute("QuickAddCart", "성공");//장바구니에 상품을 담았을때, 세션을 생성해서 jsp로 보낸다.
		//jsp에서 QuickAddCart의 값이 성공일때(구매하지 않은 상태라면 성공이 아닐때. 즉 if문을 써야하는데 jsp내부에서 eq로 썻다.)
		//jsp에서 alert가 나오게 했다. jsp 참조.
		//return "redirect:/cart/cartView";	
		return "redirect:/productDetail?p_number="+p_number;
	}
	
	//product에서 장바구니에 추가
	@RequestMapping(value = "QuickaddCart", method = {RequestMethod.POST,RequestMethod.GET})
	public String QuickaddCart(Model model, HttpServletRequest request, Principal principal) {
		System.out.println("addCart() 장바구니에 추가!");
		HttpSession session = request.getSession();
		
		String p_number = request.getParameter("p_number"); //장바구니에 추가하려는 상품번호
		String b_amount = request.getParameter("b_amount"); //해당상품 구매갯수				
		String m_id = principal.getName(); //로그인한 사용자 id가져옴
		
		MemberVO memberVO = cartService.memberInfo(m_id); //id를 이용해서 해당회원 정보 가져옴
		ProductImageVO productImageVO = cartService.productInfo(p_number); //해당 상품번호 이용해서 이미지하나포함한 상품정보 가져옴
		
		System.out.println(productImageVO);
		int totalprice = productImageVO.getP_price() * Integer.parseInt(b_amount); //상품의 가격과 구매하려는 갯수를 곱해 총가격
		
		cartService.addCart(p_number, memberVO.getM_number(), b_amount, totalprice); //상품번호, 회원번호, 구매갯수, 총가격으로 카트테이블에 삽입
		session.setAttribute("QuickAddCart", "성공");
		//return "redirect:/cart/cartView";	
		return "redirect:/productView";
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
	public String cartBuy(Model model, Principal principal, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartBuy() 장바구니에서 체크해서 구매하기!");
		HttpSession session = request.getSession();		
	
		String[] check = request.getParameterValues("check"); //구매할 상품 체크한 수 받아옴. value는 체크한 카트아이디임
		System.out.println("================");
		System.out.println("장바구니 체크확인 : "+check);
		System.out.println("================");
		if(check == null) {
			//체크한게 없으면 다시 장바구니로			
			session.setAttribute("checkNull", "checkNull");

			return "redirect:/cart/cartView";
		}
		
		int amount = 0; //구매하려는 총갯수
		int totalprice = 0;
		String p_name = "";
		//구매하려고 체크한거를 뽑아온다 arr[0]째의 cart테이블에서 정보를 뺴온다.
		//구매할 상품 사진 이름 구매수량 구매가격을 cartBuyView에 전달
		ArrayList<CartViewVO> cart = new ArrayList<CartViewVO>();
		
		for (int i = 0; i < check.length; i++) {
			CartViewVO item = cartService.cartByCid(check[i]); //체크한 카트아이디를 이용해서 정보뽑아냄 
			amount = amount + 1; // 계속 돌면서 체크된 수 만큼 갯수가 늘게함
			totalprice = totalprice + item.getC_grandtotal();
			p_name = p_name +item.getP_name()+", ";
			cart.add(item); // 계속 돌면서 ArrayList에 담음
			System.out.println(item);
		}
		MemberVO memberVO = cartService.memberInfo(principal.getName());
		
		System.out.println(totalprice);
		
		session.setAttribute("cart", cart); // 구매하려는 상품들을 세션으로 저장
		session.setAttribute("totalprice", totalprice); // 구매하려는 상품의 총가격을 세션으로 저장
		session.setAttribute("p_name", p_name); //구매하려는 상품들 이름 +해서 결제정보에 나타내기위해 
		session.setAttribute("member", memberVO);//포인트위해 세션
		
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
	
	
}
