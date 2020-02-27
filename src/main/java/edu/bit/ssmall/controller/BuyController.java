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

@Controller
public class BuyController {

	@Autowired
	RegisterService registerService;
	
	@Autowired
	BuyService buyService;
	
	@RequestMapping(value = "buy", method = RequestMethod.POST)
	public String buy(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String b_amount = request.getParameter("b_amount");
		String p_number = request.getParameter("p_number");
		//구매버튼 누르면 주문에 필요한 정보를 담아서 넘겨야한다.
		//몇개를 살지 넘어올것이고, 해당 p_number가 넘어올것 
		//해당 p_number를 가지고 상품 정보를 빼낸다.
		
		BuyVO buyVO = buyService.productinfo(p_number);
		
		buyVO.setB_amount(Integer.parseInt(b_amount));
		buyVO.setB_total(buyVO.getB_amount() * buyVO.getP_price());
		
		
		System.out.println(buyVO);
		
		PayVO payVO = new PayVO();//validator 하기위해 담아서 보내줌
		
		HttpSession session = request.getSession();
		session.setAttribute("buyVO", buyVO);
		
		model.addAttribute("buyVO",buyVO);	
		model.addAttribute("payVO",payVO);
		return "Buy/buyView"; 
	}
	

	@RequestMapping(value = "buyDo",  method = { RequestMethod.POST, RequestMethod.GET} )
	public String buyDo(Model model, PayVO payVO, Errors errors, Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("buyDo()");
		//사용자정보
		String m_id = principal.getName(); //로그인한 사용자 id가져옴
		
		//배송정보들
		String addr1 =request.getParameter("addr1");
		String addr2 =request.getParameter("addr2");
		String addr3 =request.getParameter("addr3");
			
		//상품정보들
		String p_number = request.getParameter("p_number"); //상품번호가져옴
		String b_amount = request.getParameter("b_amount");
		String b_total = request.getParameter("b_total");
				
		String p_name = buyService.productName(p_number); //해당 상품 이름 가져옴
			
		int result = registerService.check(addr1, addr2, addr3); //registerService에 주소 널값 확인 (NULL 이면 1 반환)
		
		
		new PayValidator().validate(payVO, errors);
		
		if(result == 1 || errors.hasErrors()) {
			//주소가 널값이거나 에러가 발생한다면 정보다시 확인하라는 경고창 띄움
			System.out.println("에러발생");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('입력한 정보를 다시 확인하여 주세요!');</script>");			 
			out.flush();
			
			BuyVO buyVO = buyService.productinfo(p_number);		
			buyVO.setB_amount(Integer.parseInt(b_amount));
			buyVO.setB_total(Integer.parseInt(b_total));
			
			model.addAttribute(buyVO);
			return "Buy/buyView";
		}
		String adress = "(" + addr1 + ") " + addr2 + " " + addr3;		
		payVO.setAddr(adress);
		
		MemberVO memberVO = buyService.memberInfo(m_id); //해당 아이디의 정보를 가져옴
		
		model.addAttribute("email", memberVO.getM_email()); //이메일
		model.addAttribute("p_name", p_name); //상품명
		model.addAttribute("totalprice", b_total); // 상품총가격
		model.addAttribute("amount", b_amount); // 총갯수
		model.addAttribute("payVO",payVO); //구매자 정보
		
		
		return "Buy/payment";
		
	}
	
	@RequestMapping(value = "paySuccess", method = { RequestMethod.POST, RequestMethod.GET} )
	public String paySuccess(Model model, PayVO payVO, HttpServletRequest req) throws Exception {
		System.out.println("paySuccess()");
		String e_mail = req.getParameter("e_mail");
		String p_name = req.getParameter("p_name");
		String b_amount = req.getParameter("b_amount");
		String b_totalprice = req.getParameter("b_totalprice");
		
		System.out.println("=====================");
		System.out.println(p_name);
		System.out.println(e_mail);
		buyService.buyOne(p_name,e_mail,b_amount,b_totalprice);
		
		return "redirect:/";
	}
		
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
