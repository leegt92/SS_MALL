package edu.bit.ssmall.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.valid.MemberValidator;
import edu.bit.ssmall.vo.MemberVO;

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
			
			mv.addObject("memberVO", new MemberVO());
			return mv;
		}
	}	

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    binder.setValidator(new MemberValidator());
	}

	@RequestMapping("/register.do")
	public String registerDo(@Valid MemberVO memberVO, BindingResult result, HttpServletResponse response) throws Exception {
		System.out.println("회원가입 시작");
		
		if(result.hasErrors()) {
			return "redirect:register1";		
		}
		else{
			registerService.register(memberVO);
			return "redirect:login";
		}
	}

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/idChk", method = RequestMethod.GET)
	@ResponseBody
	public int idChk(@RequestParam("m_id") String m_id) {
		System.out.println("아이디 중복체크");
		return registerService.idChk(m_id);
	}


}
