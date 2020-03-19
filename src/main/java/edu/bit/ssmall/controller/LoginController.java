package edu.bit.ssmall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.bit.ssmall.oauth.SNSLogin;
import edu.bit.ssmall.oauth.SnsValue;
import edu.bit.ssmall.service.LoginService;
import edu.bit.ssmall.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private SnsValue naverSns;
	
	@Autowired
	private SnsValue googleSns;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	LoginService loginService;
	
	//로그인 페이지로
	@RequestMapping("/login")
	public String login(Model model) throws Exception {
		System.out.println("로그인 페이지로");
		
		
		SNSLogin naverLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", naverLogin.getNaverAuthURL());
		
		SNSLogin googleLogin = new SNSLogin(googleSns);
		model.addAttribute("google_url", googleLogin.getNaverAuthURL());
		/* 구글code 발행을 위한 URL 생성 */
		/*
		 * OAuth2Operations oauthOperations =
		 * googleConnectionFactory.getOAuthOperations(); String url =
		 * oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
		 * googleOAuth2Parameters);
		 */

		//model.addAttribute("google_url", url);


		return "login";
	}
	
	@RequestMapping(value="{snsService}/callback", method = { RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(@PathVariable String snsService, Model model, @RequestParam String code, HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();

		System.out.println("snsLoginCallback : sevice={}"+snsService);
		
		SnsValue sns = null;
		
		if(snsService.equals("naver")) {
			sns = naverSns;
		}else if(snsService.equals("google")) {
			sns = googleSns;
		}
		
		//1.code를 이용해서 access_token 받기
		//2.access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);
		
		
		MemberVO memberVO = snsLogin.getUserProfile(code);
		System.out.println("Profile>>"+memberVO.getM_naver()+memberVO.getM_email()+memberVO.getM_name());

		
		//3.DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼추가)
		MemberVO member = loginService.getBySns(memberVO);
	
		if (member == null) {
			model.addAttribute("result",member);
			
			
			
		}else {
			model.addAttribute("result",memberVO.getM_name()+"님 반갑습니다.");
			session.setAttribute("member", member);
			
		}
		
		
		
		return "loginResult";
	}
	
	
}
