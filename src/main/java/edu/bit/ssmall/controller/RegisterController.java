package edu.bit.ssmall.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ssmall.exception.AlreadyExistingIdException;
import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.valid.MemberValidator;
import edu.bit.ssmall.vo.RegisterRequest;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;


	@RequestMapping("/register1")
	public String register1() {
		System.out.println("이용약관 페이지로 ");
		return "register1";
	}

	@RequestMapping("/register2")
	public ModelAndView register2(@RequestParam(value="agree", defaultValue="false") Boolean agree, HttpServletResponse response) throws Exception {
		if(!agree) {
			ModelAndView mv = new ModelAndView("register1");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('약관에 동의하여 주세요');</script>");			 
			out.flush();
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("register2");
			
			mv.addObject("registerRequest", new RegisterRequest());
			return mv;
		}
	}

	
	@RequestMapping("/register.do")
	public ModelAndView registerDo(RegisterRequest regReq, Errors errors) throws Exception{
	
		new MemberValidator().validate(regReq, errors);
		
		if(errors.hasErrors()) {
			ModelAndView mv = new ModelAndView("register2");
			return mv;
		}
		try {
			registerService.register(regReq); 
		} catch (AlreadyExistingIdException e) {
			e.printStackTrace();
			errors.rejectValue("m_id", "duplicate", "이미 가입된 아이디입니다.");
			ModelAndView mv = new ModelAndView("register2");
			return mv;
		}
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

}
