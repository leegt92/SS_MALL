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
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.iamport.IamPort;
import edu.bit.ssmall.service.BuyService;
import edu.bit.ssmall.service.CartService;
import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.vo.CartViewVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductImageVO;

//구매관련 컨트롤러
@Controller
@RequestMapping("buy")
public class BuyController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	RegisterService registerService;
	
	@Autowired
	BuyService buyService;

	@Autowired
	IamPort iamPort;
	
	//productDetail에서 구매하기 누를 시
	@RequestMapping(value = "buy", method = {RequestMethod.POST,RequestMethod.GET})
	public String buy(Model model, HttpServletRequest request, HttpServletResponse response,Principal principal) {
		
		String amount = request.getParameter("b_amount"); //구매수량
		String p_number = request.getParameter("p_number"); //상품번호
		//구매버튼 누르면 주문에 필요한 정보를 담아서 넘겨야한다.
		//몇개를 살지 넘어올것이고, 해당 p_number가 넘어올것 
		//해당 p_number를 가지고 상품 정보를 빼낸다.
		
		ProductImageVO productImageVO = buyService.productinfo(p_number); //상품에대한 정보를 뽑아온다.		
		int totalprice = productImageVO.getP_price() * Integer.parseInt(amount); //구매수량과 상품가격을 더해서 구매할 totalprice 구함
		
		System.out.println("productImageVO 출력 : "+productImageVO); //상품정보 체크
		
		MemberVO memberVO = buyService.memberInfo(principal.getName());
	
		HttpSession session = request.getSession(); 
		
		session.setAttribute("productImageVO", productImageVO);// productImageVO(상품정보) 세션처리해준다. 		
		session.setAttribute("amount", amount); //구매수량 세션처리
		session.setAttribute("totalprice", totalprice); //총가격 세션처리
		session.setAttribute("member", memberVO); //포인트위해 세션처리

		return "Buy/buyView"; 
	}

	@ResponseBody
	@RequestMapping(value = "pointInfo", method = { RequestMethod.POST, RequestMethod.GET})
	public MemberVO pointInfo(Principal principal) throws Exception {
	
		
		return buyService.memberInfo(principal.getName());
	}
	
	@ResponseBody
	@RequestMapping(value = "/payments/complete", method = { RequestMethod.POST, RequestMethod.GET})
	public String complete(HttpServletRequest request) throws Exception {
		String imp_uid = request.getParameter("imp_uid");
		String price = request.getParameter("price");
	
		System.out.println("imp_uid : " + imp_uid);
		System.out.println("price : " + price);

		
		HttpSession session = request.getSession();
		
		session.removeAttribute("totalprice"); //예전가격
		
		session.setAttribute("imp_uid", imp_uid);	
		session.setAttribute("price", price); //포인트까지 적용한 최종가격

		
		return iamPort.getPaymentInfo(imp_uid);		
	}
	
	//결제가 성공하면 db처리
	@RequestMapping(value = "iamport", method = { RequestMethod.POST, RequestMethod.GET})
	public String iamport(HttpServletRequest request, Model model, Principal principal) throws Exception {
		HttpSession session = request.getSession();
		
		//=========================== 구매정보들 =============================//
		String usePoint = request.getParameter("usingPoint");
		if (usePoint.equals("")) {
			usePoint = "0";
		}
		String b_name = request.getParameter("name");//구매자명
		String b_phonenum = request.getParameter("phonenum");//구매자 핸드폰번호
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String b_addr = "(" + addr1 + ") " + addr2 + " " + addr3; //구매자 주소
		String b_memo = request.getParameter("memo"); //배송메시지
		String imp_uid = (String) session.getAttribute("imp_uid");
		
		//==============================================================//
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ArrayList<CartViewVO> list = (ArrayList<CartViewVO>) session.getAttribute("cart");
		
		//=========================== 단일상품 구매 =============================//
		if(list == null) {
			ProductImageVO productImageVO = (ProductImageVO) session.getAttribute("productImageVO");
			
			String totalprice = (String) session.getAttribute("price");
			String amount = (String) session.getAttribute("amount");
	
			buyService.buy(Integer.toString(memberVO.getM_number()), Integer.toString(productImageVO.getP_number()), amount, totalprice, imp_uid, b_memo, b_name, b_phonenum, b_addr, Integer.parseInt(usePoint));
			//포인트사용
			buyService.minusPoint(memberVO.getM_number(), Integer.parseInt(usePoint));
			
			session.removeAttribute("productImageVO"); //상품정보 삭제
			session.removeAttribute("price");// 결제한 금액 정보 삭제
			session.removeAttribute("amount");//결제한 수량 정보 삭제
		
		}else {
		//=========================== 장바구니 구매 =============================//	
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list);
				String p_number = Integer.toString(list.get(i).getP_number());//상품번호
				String amount = Integer.toString(list.get(i).getC_amount());//구매할 갯수
				String totalprice = Integer.toString(list.get(i).getC_grandtotal());//한상품 구매총가격
			
				buyService.buy(Integer.toString(memberVO.getM_number()), p_number, amount, totalprice, imp_uid, b_memo, b_name, b_phonenum, b_addr, Integer.parseInt(usePoint));
				cartService.cartDelete(list.get(i).getC_id());
			}
			buyService.minusPoint(memberVO.getM_number(), Integer.parseInt(usePoint));
			session.removeAttribute("cart"); //구매하려한 물건들 세션삭제
			session.removeAttribute("p_name"); // 상품이름 다 더한것 결제정보 위해 
		}
		
		session.removeAttribute("member"); //멤버 세션삭제
		session.removeAttribute("imp_uid");//고유번호 삭제
		
		return "redirect:/";	
	}
	
	
}
