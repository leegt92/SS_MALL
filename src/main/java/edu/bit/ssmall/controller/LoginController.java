package edu.bit.ssmall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.bit.ssmall.service.LoginService;
import edu.bit.ssmall.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping("/login")
	public String login() {
		System.out.println("로그인 페이지로");
		return "login";
	}

	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(MemberVO memberVO, HttpServletRequest req, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		System.out.println("로그인 하기");
		//세션id만 주기 때문에 사실상 쿠키 HttpServletRequest에서 받아온다
		HttpSession session = req.getSession();

		String rawPw = memberVO.getM_password();
		
		System.out.println("입력한 아이디 = "+ memberVO.getM_id());
		System.out.println("입력한 비밀번호 ="+ rawPw);
		System.out.println("=============");
		String pw = loginService.login(memberVO).getM_password();
	
		System.out.println("db 패스워드= "+pw);
		
		
		if(passwordEncoder.matches(rawPw, pw)) {
			
			System.out.println("비밀번호 일치");
			memberVO.setM_password(pw);
			
			session.setAttribute("member", memberVO);
			
			
			return "redirect:/";
		} else {
			
			System.out.println("비밀번호 불일치");
	
			rttr.addFlashAttribute("msg", false);
			
			return "redirect:/login";
		}  
	
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		
		System.out.println("logout실행");
		session.invalidate();
		return "redirect:/";	
	}


}
