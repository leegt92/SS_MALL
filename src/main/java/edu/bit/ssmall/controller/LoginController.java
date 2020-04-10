package edu.bit.ssmall.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;

import edu.bit.ssmall.oauth.KakaoAPI;
import edu.bit.ssmall.oauth.SNSLogin;
import edu.bit.ssmall.oauth.SnsValue;
import edu.bit.ssmall.service.LoginService;
import edu.bit.ssmall.vo.MemberVO;

//로그인할 컨트롤러 시큐리티가 로그인은 다해서 사실상 소셜로그인 컨트롤러임
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
		//빈설정에서 naverSns에대한 정보 (clientID, clientSecret, callbackUrl)을 SNSLogin 생성자로 넣어줌.
		
		model.addAttribute("naver_url", naverLogin.getNaverAuthURL()); //naver 로그인 하는 url 창을 띄우는 주소를 넘겨줌
		model.addAttribute("kakao_url", KakaoAPI.getAuthorizationUrl(session)); //kakao 로그인하는 url 창을 띄우는 주소를 넘겨줌.
 

		return "Login/login";
	}		
	
	//네이버로그인 창에서 로그인하면 지정한 콜백함수로 토큰값 넘어옴 http://localhost:8282/ssmall/naver/callback이 콜백주소인데 그뒤에 ? 해서 겟방식으로 토큰 넘어옴
	@RequestMapping(value="naver/callback", method = { RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(Model model, @RequestParam String code, HttpServletRequest request,HttpServletResponse response)throws Exception {
		
		//1.code를 이용해서 access_token 받기
		//2.access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(naverSns);
		
		
		MemberVO memberVO = snsLogin.getUserProfile(code); //코드를 이용해서 m_naver, m_email, m_name 값 추출
		System.out.println("Profile>>"+memberVO);
	
		//3.DB 해당 유저가 존재하는 체크 (m_naver로 비교)
		int num = loginService.naverCheck(memberVO); 
	
		if (num == 0) {			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('가입이 되어있지 않습니다. 회원가입창으로 이동합니다.');</script>");			 		
			out.flush();
			
			//m_naver가 없으면 가입되어있지 않다는 알림창 띄우고 네이버유저가 간단한 회원가입 할수있는 view로 보내줌
			model.addAttribute("memberVO",memberVO);
			return "Register/naverRegister";		
		}			
		MemberVO member = loginService.naverLogin(memberVO.getM_naver());	
		System.out.println(member); 
		
		//있으면 자동로그인위해서 m_naver, m_email, m_name을 담은 멤버를 보낼건데 m_email은 id로 이용 m_naver(토큰)은 비밀번호로 이용
		model.addAttribute("member", member); 
		return "Login/naverLogin";
		
	}
	
	//카카오로그인창에서 로그인하면 http://localhost:8282/ssmall/kakao/callback? 뒤에 토큰값이 get방식으로 넘어옴.
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

		name = properties.path("nickname").asText(); //이름이 따로없고 닉네임으로 되어있어서 그걸 이름으로 했음
		email = kakao_account.path("email").asText(); //email을 id처럼 사용할 예정

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
			//m_kakao가 없으면 가입창 유도하고 정보 넘김
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('가입이 되어있지 않습니다. 회원가입창으로 이동합니다.');</script>");			 
			out.flush();
			
			model.addAttribute("memberVO",memberVO);
			return "Register/kakaoRegister";		
		}
		
		MemberVO member = loginService.kakaoLogin(memberVO.getM_kakao()); 
			
		model.addAttribute("member", member); //아이디가 있으면 자동로그인을위해 m_id 와 m_pw를 넘기기위해 member객체 넘김 id는 카카오이메일 pw는 카카오토큰 암호화한거임 
		System.out.println(member);
			
		return "Login/kakaoLogin";
		

	}
	
}

