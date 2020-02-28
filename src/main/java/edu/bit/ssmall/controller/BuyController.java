package edu.bit.ssmall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.service.BuyService;
import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.valid.PayValidator;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.PayVO;

//구매관련 컨트롤러
@Controller
public class BuyController {

	@Autowired
	RegisterService registerService;
	
	@Autowired
	BuyService buyService;
	
	//productDetail에서 구매하기 누를 시
	@RequestMapping(value = "buy", method = RequestMethod.POST)
	public String buy(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String b_amount = request.getParameter("b_amount"); //구매수량
		String p_number = request.getParameter("p_number"); //상품번호
		//구매버튼 누르면 주문에 필요한 정보를 담아서 넘겨야한다.
		//몇개를 살지 넘어올것이고, 해당 p_number가 넘어올것 
		//해당 p_number를 가지고 상품 정보를 빼낸다.
		
		BuyVO buyVO = buyService.productinfo(p_number); //상품에대한 정보를 뽑아온다.
		
		buyVO.setB_amount(Integer.parseInt(b_amount)); //b_amount에 input으로 넘어온 구매수량을 넣는다(문자이므로 숫자로 변환)
		buyVO.setB_total(buyVO.getB_amount() * buyVO.getP_price());	//상품의 가격인 price와 입력받은 구매수량을 곱해서 b_total에 넣는다.
		
		System.out.println("buyVO 출력 : "+buyVO); 
		
		PayVO payVO = new PayVO();//validator 하기위해 담아서 보내줌 (회원가입때랑 마찬가지로 form:form command에 payVO하기위해)
		
		HttpSession session = request.getSession(); 
		session.setAttribute("buyVO", buyVO);// buyVO 세션처리해준다. 
		
		model.addAttribute("buyVO",buyVO);	
		model.addAttribute("payVO",payVO);
		return "Buy/buyView"; 
	}
	
	//주문정보에서 값을 입력받아서 결제하기를 눌렀을 때
	@RequestMapping(value = "buyDo",  method = { RequestMethod.POST, RequestMethod.GET} )
	public String buyDo(Model model, PayVO payVO, Errors errors, Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("buyDo()");
		
		//사용자정보
		String m_id = principal.getName(); //로그인한 사용자 id가져옴 (시큐리티 Principal) 
		
		//배송정보들
		String addr1 =request.getParameter("addr1");
		String addr2 =request.getParameter("addr2");
		String addr3 =request.getParameter("addr3");
			
		//상품정보들
		String p_number = request.getParameter("p_number"); //상품번호가져옴
		String b_amount = request.getParameter("b_amount"); //구매수량
		String b_total = request.getParameter("b_total"); //구매가격
				
		String p_name = buyService.productName(p_number); //해당 상품 이름 가져옴
			
		int result = registerService.check(addr1, addr2, addr3); //registerService의 check 함수로 주소 널값 확인 (NULL 이면 1 반환)
			
		new PayValidator().validate(payVO, errors); //입력받은 값중에 비어있거나 입력이 잘못됨을 확인하기위해 validator 해줌.
		
		if(result == 1 || errors.hasErrors()) {
			//주소가 널값이거나 에러가 발생한다면 정보다시 확인하라는 경고창 띄움
			System.out.println("에러발생");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('입력한 정보를 다시 확인하여 주세요!');</script>");			 
			out.flush();
			
			HttpSession session = request.getSession(); 
			model.addAttribute("buyVO",session.getAttribute("buyVO")); //세션에 저장해뒀던 buyVO다시 넘김
			
			return "Buy/buyView";
		}
		String adress = "(" + addr1 + ") " + addr2 + " " + addr3;
		payVO.setAddr(adress); //주소 널값없으면 합침
		
		MemberVO memberVO = buyService.memberInfo(m_id); //해당 아이디의 정보를 가져옴
		
		//구매를 위해 필요한정보 넘김
		model.addAttribute("email", memberVO.getM_email()); //이메일
		model.addAttribute("p_name", p_name); //상품명
		model.addAttribute("totalprice", b_total); // 상품총가격
		model.addAttribute("amount", b_amount); // 총갯수
		model.addAttribute("payVO",payVO); //구매자 정보
		
		//결제하는 사이트 현재는 iamport 이용해서 자바스크립트로 바로 띄워서 하는거로 함 근데 환불이나 취소같은거는 알아야함
		return "Buy/payment"; 
		
	}
	
	//결제가 성공하면
	@RequestMapping(value = "paySuccess", method = { RequestMethod.POST, RequestMethod.GET} )
	public String paySuccess(Model model, PayVO payVO, HttpServletRequest req) throws Exception {
		System.out.println("paySuccess()");
		String e_mail = req.getParameter("e_mail");
		String p_name = req.getParameter("p_name");
		String b_amount = req.getParameter("b_amount");
		String b_totalprice = req.getParameter("b_totalprice");
		
		buyService.buyOne(p_name,e_mail,b_amount,b_totalprice); //구매 시작
		HttpSession session = req.getSession();
		session.removeAttribute("buyVO"); //구매성공하면 세션삭제
		
		return "redirect:/"; //다시홈으로 
	}
	
	//결제가 실패하면 
	@RequestMapping(value = "payFail", method = { RequestMethod.POST, RequestMethod.GET} )
	public String payFail(Model model,PayVO payVO, HttpServletResponse response,HttpServletRequest request) throws Exception {
		System.out.println("payFail()");
		HttpSession session = request.getSession();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	
		out.println("<script>alert('확인 후 진행하여 주세요');</script>");			 
		out.flush();
		
		model.addAttribute("cart",session.getAttribute("cart"));
		return "Buy/buyView";
	}

	
}
