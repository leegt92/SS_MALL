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
		
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public MemberVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrls());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	
	}

	private MemberVO parseJson(String body) throws Exception {
		MemberVO memberVO = new MemberVO();
		System.out.println("============\n"+body+"\n========");
		
		ObjectMapper mapper = new ObjectMapper(); //제이슨을 오브젝트로 매핑
		JsonNode rootNode = mapper.readTree(body);//바디에서 트리형태로 읽어옴
		
		
		JsonNode resNode = rootNode.get("response");
		memberVO.setM_naver(resNode.get("id").asText());		
		memberVO.setM_name(resNode.get("name").asText());
		memberVO.setM_email(resNode.get("email").asText());			
		
		
		return memberVO;
	}
	
}
