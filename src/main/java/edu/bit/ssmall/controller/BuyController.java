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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.kakaopay.KakaoPay;
import edu.bit.ssmall.kakaopay.KakaoPayApprovalVO;
import edu.bit.ssmall.service.BuyService;
import edu.bit.ssmall.service.CartService;
import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.valid.PayValidator;
import edu.bit.ssmall.vo.CartViewVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.PayVO;
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
	KakaoPay kakaoPay;
	
	//productDetail에서 구매하기 누를 시
	@RequestMapping(value = "buy",  method = { RequestMethod.POST, RequestMethod.GET} )
	public String buy(Model model, HttpServletRequest request, HttpServletResponse response,Principal principal) {
		System.out.println("buy 구매!");
		String amount = request.getParameter("b_amount"); //구매수량
		String p_number = request.getParameter("p_number"); //상품번호
		System.out.println("p_number"+p_number);
		//구매버튼 누르면 주문에 필요한 정보를 담아서 넘겨야한다.
		//몇개를 살지 넘어올것이고, 해당 p_number가 넘어올것 
		//해당 p_number를 가지고 상품 정보를 빼낸다.
		
		ProductImageVO productImageVO = buyService.productinfo(p_number); //상품에대한 정보를 뽑아온다.		
		int totalprice = productImageVO.getP_price() * Integer.parseInt(amount); //구매수량과 상품가격을 더해서 구매할 totalprice 구함
		
		System.out.println("productImageVO 출력 : "+productImageVO); //상품정보 체크
		
		PayVO payVO = new PayVO();
		MemberVO memberVO = buyService.memberInfo(principal.getName());
		
		
		HttpSession session = request.getSession(); 
		
		session.setAttribute("productImageVO", productImageVO);// productImageVO(상품정보) 세션처리해준다. 		
		session.setAttribute("amount", amount); //구매수량 세션처리
		session.setAttribute("totalprice", totalprice); //총가격 세션처리
		session.setAttribute("member", memberVO);
		model.addAttribute("payVO",payVO); //validator 하기위해 담아서 보내줌 (회원가입때랑 마찬가지로 form:form command에 payVO하기위해)
		
		return "Buy/buyView"; 
	}
	
	//주문정보에서 값을 입력받아서 결제하기를 눌렀을 때
	@RequestMapping(value = "buyDo",  method = { RequestMethod.POST, RequestMethod.GET} )
	public String buyDo(Model model, PayVO payVO, Errors errors, Principal principal, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("buyDo()");
		HttpSession session = request.getSession();
		
		//주소지
		String addr1 =request.getParameter("addr1");
		String addr2 =request.getParameter("addr2");
		String addr3 =request.getParameter("addr3");
		
		int result = registerService.check(addr1, addr2, addr3); //registerService의 check 함수로 주소 널값 확인 (NULL 이면 1 반환)			
		new PayValidator().validate(payVO, errors); //입력받은 값중에 비어있거나 입력이 잘못됨을 확인하기위해 validator 해줌.		
		
		if(result == 1 || errors.hasErrors()) {
			//주소가 널값이거나 에러가 발생한다면 정보다시 확인하라는 경고창 띄움
			System.out.println("에러발생");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('입력한 정보를 다시 확인하여 주세요!');</script>");			 
			out.flush();
			
			return "Buy/buyView";
		}
		String adress = "(" + addr1 + ") " + addr2 + " " + addr3;
		String amount =  String.valueOf(session.getAttribute("amount"));
		int usingPoint = 0; //사용포인트 초기화
		
		int totalprice = Integer.parseInt(String.valueOf(session.getAttribute("totalprice"))); //상품의 원래가격
		
		if(request.getParameter("usingPoint").equals("")) {
			
			usingPoint = 0;
		
		}else {
			//포인트 사용했으면 usingPoint 갱신
			usingPoint = Integer.parseInt(request.getParameter("usingPoint"));
		}
		
		int finalPrice = totalprice - usingPoint; //원래가격 - 포인트가격 
		System.out.println("totalPrice(원래가격) : " + totalprice);
		System.out.println("usingPoint(사용포인트) : " + usingPoint);
		System.out.println("finalPrice(최종가격) : " + finalPrice);
		
		payVO.setAddr(adress);
		payVO.setTotalPrice(finalPrice);
		payVO.setAmount(amount);
		
		session.setAttribute("payVO",payVO); //구매정보를 담은 객체 세션처리.
		session.setAttribute("usePoint", usingPoint);
		
		session.removeAttribute("totalprice"); //가격 수량 payVO로 세션처리햇으니 두개삭제
		session.removeAttribute("amount");
		
		
		ProductImageVO productImageVO = (ProductImageVO) session.getAttribute("productImageVO");

		String m_id = principal.getName(); //로그인한 사용자 id가져옴 (시큐리티 Principal) 		
		String p_name = productImageVO.getP_name(); //상품이름

		String url = kakaoPay.kakaoPayReady(p_name,Integer.toString(finalPrice), amount, m_id, request); //에러가 있다면 null
		
		if(url == null) {
			System.out.println("url : "+url);
			return "redirect:/";
		}
		//결제창 띄우는 거임
		return "redirect:" + url;
		
	}
	
	//결제요청이 성공하면 오는 곳
	@RequestMapping(value = "kakaoPaySuccess", method = { RequestMethod.POST, RequestMethod.GET} )
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token,Principal principal, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(); 
		//결제가 완료되면 info하는건데 결제 확인 취소 되는거 확인했으니
		//결제가 완료되면 구매테이블에 추가하고 , 재고 줄이고 , 판매량 늘리고 해야함.
		System.out.println("kakaoPaySuccess 시작");
		System.out.println("kakaoPaySuccess pg_token : " + pg_token);
		//pg_token으로 결제승인 요청 해야함.
		
		ProductImageVO productImageVO = (ProductImageVO) session.getAttribute("productImageVO");				

		int usePoint = Integer.parseInt(String.valueOf(session.getAttribute("usePoint")));
		System.out.println(usePoint);
		
		//단일상품 구매
		if(productImageVO != null) {
			System.out.println("단일상품 구매 시작!");
			String m_id = principal.getName(); //로그인한 사용자 id가져옴 (시큐리티 Principal) 		
			String p_name = productImageVO.getP_name(); //상품이름
			
			//결제승인처리 한다.
			KakaoPayApprovalVO kakaoPayApprovalVO = kakaoPay.kakaoPayInfo(pg_token, p_name, m_id, request);
		
			if(kakaoPayApprovalVO == null) {
				System.out.println("결제승인 안됨");
				return "redirect:/";
			}
			
			//성공하면 db 저장
			PayVO payVO = (PayVO)session.getAttribute("payVO");
			MemberVO memberVO = buyService.memberInfo(m_id);

			String m_number = Integer.toString(memberVO.getM_number()); //회원번호
			String p_number = Integer.toString(productImageVO.getP_number()); //상품번호
			String totalprice = Integer.toString(payVO.getTotalPrice()); //구매총가격
			String amount =  payVO.getAmount(); //구매할 갯수
			String b_kakao_tid = kakaoPayApprovalVO.getTid(); //카카오페이 결제고유번호 
			String b_memo = payVO.getMemo(); //배송메시지
			String b_name = payVO.getName(); //수령인
			String b_phonenum = payVO.getPhonenum();//수령인 전화번호
			String b_addr = payVO.getAddr(); //수령받을 주소		
			
			//구매
			buyService.buy(m_number,p_number,amount,totalprice,b_kakao_tid,b_memo,b_name,b_phonenum,b_addr, usePoint);
			
			//포인트사용
			buyService.minusPoint(memberVO.getM_number(), usePoint);
			
			session.removeAttribute("payVO"); //구매정보 payVO 세션삭제
			session.removeAttribute("productImageVO"); //상품정보들 세션삭제
			session.removeAttribute("usePoint"); // 사용포인트 세션삭제
			
			session.setAttribute("success","success");
	
			return "redirect:/";
		
		}else {
			System.out.println("장바구니 구매 시작!");
			//장바구니에서 체크한 상품들 구매
			
			String m_id = principal.getName(); //로그인한 사용자 id가져옴	
			String p_name = (String) session.getAttribute("p_name");
			
			//결제승인처리 한다.
			KakaoPayApprovalVO kakaoPayApprovalVO = kakaoPay.kakaoPayInfo(pg_token, p_name, m_id, request);
			
			if(kakaoPayApprovalVO == null) {			
				System.out.println("결제승인 안됨");
				return "redirect:/";
			}
			
			//kakaoPayApprovalVO가 null이 아니면 db에 구매내역 저장
			PayVO payVO = (PayVO)session.getAttribute("payVO");
			System.out.println("디버깅위한 payVO" + payVO);
			MemberVO memberVO = buyService.memberInfo(m_id);
			
			ArrayList<CartViewVO> list = (ArrayList<CartViewVO>) session.getAttribute("cart");
			
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list);
				
				String m_number = Integer.toString(list.get(i).getM_number());//회원번호
				String p_number = Integer.toString(list.get(i).getP_number());//상품번호
				String amount = Integer.toString(list.get(i).getC_amount());//구매할 갯수
				String totalprice = Integer.toString(list.get(i).getC_grandtotal());//구매총가격
				String b_kakao_tid = kakaoPayApprovalVO.getTid(); //카카오페이 결제고유번호 
				String b_memo = payVO.getMemo(); //배송메시지
				String b_name = payVO.getName(); //수령인
				String b_phonenum = payVO.getPhonenum();//수령인 전화번호
				String b_addr = payVO.getAddr(); //수령받을 주소
			
				buyService.buy(m_number,p_number,amount,totalprice,b_kakao_tid,b_memo,b_name,b_phonenum,b_addr,usePoint);
				cartService.cartDelete(list.get(i).getC_id());
			}
			
			buyService.minusPoint(memberVO.getM_number(), usePoint);
			
			session.removeAttribute("payVO"); //구매정보 payVO 세션삭제
			session.removeAttribute("cart"); //상품정보들 세션삭제
			session.removeAttribute("usePoint"); // 사용포인트 세션삭제
			
			session.setAttribute("success","success");

			return "redirect:/";
		
		}
		
	}
	
	@RequestMapping(value = "kakaoPayCancel", method = { RequestMethod.POST, RequestMethod.GET})
	public String kakaoPayCancel(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("결제취소");
		HttpSession session = request.getSession();
		
		session.removeAttribute("payVO"); //구매정보 payVO 세션삭제
		session.removeAttribute("productImageVO"); //상품정보들 세션삭제
		session.removeAttribute("cart");
		
		session.setAttribute("cancel", "cancel");
		
		return "redirect:/";
	}
	
	//결제에 실패할시 
	@RequestMapping(value = "kakaoPaySuccessFail", method = { RequestMethod.POST, RequestMethod.GET})
	public String kakaoPaySuccessFail(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("결제실패");
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("payVO"); //구매정보 payVO 세션삭제
		session.removeAttribute("productImageVO"); //상품정보들 세션삭제
		session.removeAttribute("cart"); //구매할 카트목록 삭제
		
		session.setAttribute("fail", "fail");
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "pointInfo", method = { RequestMethod.POST, RequestMethod.GET})
	public MemberVO pointInfo(Principal principal) throws Exception {
	
		
		return buyService.memberInfo(principal.getName());
	}
	

}
