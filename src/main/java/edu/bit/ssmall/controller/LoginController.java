package edu.bit.ssmall.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;

import edu.bit.ssmall.oauth.KakaoAPI;
import edu.bit.ssmall.oauth.SNSLogin;
import edu.bit.ssmall.oauth.SnsValue;
import edu.bit.ssmall.service.LoginService;
import edu.bit.ssmall.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private SnsValue naverSns;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	LoginService loginService;
	
	//로그인 페이지로
	@RequestMapping("/login")
	public String login(Model model, HttpSession session) throws Exception {
		System.out.println("로그인 페이지로");
				
		SNSLogin naverLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", naverLogin.getNaverAuthURL());
	
		model.addAttribute("kakao_url",KakaoAPI.getAuthorizationUrl(session));
		/*
		 * // 구글code 발행을 위한 URL 생성
		 * 
		 * OAuth2Operations oauthOperations =
		 * googleConnectionFactory.getOAuthOperations(); String url =
		 * oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
		 * googleOAuth2Parameters);
		 * 
		 * 
		 * model.addAttribute("google_url", url);
		 */
		 

		return "Login/login";
	}
	
	@RequestMapping(value="naver/callback", method = { RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(Model model, @RequestParam String code, HttpServletRequest request,HttpServletResponse response)throws Exception {
		
		//1.code를 이용해서 access_token 받기
		//2.access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(naverSns);
		
		
		MemberVO memberVO = snsLogin.getUserProfile(code);
		System.out.println("Profile>>"+memberVO);

		
		//3.DB 해당 유저가 존재하는 체크 (m_naver로 비교)
		int num = loginService.naverCheck(memberVO);
	
		if (num == 0) {
			model.addAttribute("memberVO",memberVO);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('가입이 되어있지 않습니다. 회원가입창으로 이동합니다.');</script>");			 
			out.flush();
			return "Register/naverRegister";		
		}else {
			MemberVO member = loginService.naverLogin(memberVO.getM_naver());
			model.addAttribute("member", member);
			System.out.println(member);
			return "Login/naverLogin";
		}
	}
	
	@RequestMapping(value="kakao/callback", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		KakaoAPI kakaoAPI = new KakaoAPI();

		//JsonNode트리형태로 토큰받아온다
		JsonNode node = kakaoAPI.getAccessToken(code);
		
		 // 여러 json객체 중 access_token을 가져온다,accessToken에 사용자의 로그인한 모든 정보가 들어있음
        JsonNode accessToken = node.get("access_token");
       
        System.out.println("access_token : " + accessToken);

		//사용자의 정보
		JsonNode userInfo = kakaoAPI.getKakaoUserInfo(accessToken);
	 
		// Get id
		String id = userInfo.path("id").asText();
		String name = null;
		String email = null;

		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");

		name = properties.path("nickname").asText();
		email = kakao_account.path("email").asText();

		MemberVO memberVO = new MemberVO();
		
		memberVO.setM_kakao(id);
		memberVO.setM_name(name);
		memberVO.setM_email(email);
		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("email : " + email);

		//3.DB 해당 유저가 존재하는 체크 (m_kakao로 비교)
		int num = loginService.kakaoCheck(memberVO);
		
		if (num == 0) {
			model.addAttribute("memberVO",memberVO);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('가입이 되어있지 않습니다. 회원가입창으로 이동합니다.');</script>");			 
			out.flush();
			return "Register/kakaoRegister";		
		}else {
			MemberVO member = loginService.kakaoLogin(memberVO.getM_kakao());
			
			model.addAttribute("member", member);
			System.out.println(member);
			
			return "Login/kakaoLogin";
		}


	}
	
}
