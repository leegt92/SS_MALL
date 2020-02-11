package edu.bit.ssmall.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.bit.ssmall.service.LoginService;
import edu.bit.ssmall.vo.MemberVO;

@Controller
public class LoginController {
	
	@Inject
	LoginService loginService;
	
	@RequestMapping("/login")
	public String login() {
		System.out.println("로그인 페이지로");
		return "login";
	}

	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) {
		System.out.println("로그인 하기");
		//세션id만 주기 때문에 사실상 쿠키 HttpServletRequest에서 받아온다
		HttpSession session = req.getSession();
		
		String m_id = req.getParameter("m_id");
		String m_password = req.getParameter("m_password");
		System.out.println("m_id = "+ m_id);
		System.out.println("m_password ="+ m_id);
		
		MemberVO login = loginService.login(m_id,m_password);
	
		if(login == null) {
			//RedirectAttributes
			//새로고침하면 날라가는데이터(일회성)
			rttr.addFlashAttribute("msg", false);					
		} else {
			//로그인 되면 세션처리 해야한다.
			session.setAttribute("member", login);
		}
		return "redirect:mypage";
	}
	

	
	
	
	
	
}
