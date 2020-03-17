package edu.bit.ssmall.oauth;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import edu.bit.ssmall.vo.MemberVO;

public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SNSLogin(SnsValue sns) { 
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
		this.sns = sns;
		//생성자로 naverSns값 받아서  OAuth20Service를 이용하여 빌더패턴으로 id scecert callbackurl 지정해주고
		//SnsValue에 profile url도지정
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
		//인증 주소를 oauthService가 알아서 찾아서 해줌
	}

	public MemberVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code); 
		//로그인하면 callback주소 뒤에  get방식으로 토큰값이 넘어오는걸 받는다. 
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrls()); 
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request); //body형태로 만들어줌
		return parseJson(response.getBody()); //parseJson함수를 불러서 토큰을 이용하여 토큰,이름,이메일을담은 memberVO 반환
	
	}

	private MemberVO parseJson(String body) throws Exception { //제이슨으로 변환함수
		
		MemberVO memberVO = new MemberVO();
		System.out.println("============\n"+body+"\n========");
		
		ObjectMapper mapper = new ObjectMapper(); //제이슨을 오브젝트로 매핑
		JsonNode rootNode = mapper.readTree(body);//바디에서 트리형태로 읽어옴
		
		
		JsonNode resNode = rootNode.get("response"); 
		memberVO.setM_naver(resNode.get("id").asText()); //id(토큰)를 멤버에 네이버토큰에 넣는다.		
		memberVO.setM_name(resNode.get("name").asText()); //이름 넣는다
		memberVO.setM_email(resNode.get("email").asText());	//이메일 넣는다.
		
		
		return memberVO;
	}
	
}
