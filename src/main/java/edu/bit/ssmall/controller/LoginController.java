package edu.bit.ssmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ssmall.service.LoginService;

@Controller
public class LoginController {
	

	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	LoginService loginService;
	
	
	@RequestMapping("/login")
	public String login(Model model) throws Exception {
		System.out.println("로그인 페이지로");
	
		return "login";
	}
	
	
}
