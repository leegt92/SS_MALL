package edu.bit.ssmall.oauth;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

public class SnsValue implements SnsUrls {
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	private String profileUrls;
	private boolean isNaver;
	private boolean isGoogle;
	
	public boolean isNaver() {
		return isNaver;
	}
	public void setNaver(boolean isNaver) {
		this.isNaver = isNaver;
	}
	public boolean isGoogle() {
		return isGoogle;
	}
	public void setGoogle(boolean isGoogle) {
		this.isGoogle = isGoogle;
	}
	public String getProfileUrls() {
		return profileUrls;
	}
	public void setProfileUrls(String profileUrls) {
		this.profileUrls = profileUrls;
	}
	public DefaultApi20 getApi20Instance() {
		return api20Instance;
	}
	public void setApi20Instance(DefaultApi20 api20Instance) {
		this.api20Instance = api20Instance;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getClientSecret() {
		return clientSecret;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	
	public SnsValue(String service, String clientId, String clientSecret, String redirectUrl) {
		
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		
		this.isNaver = this.service.equals("naver");
		this.isGoogle = this.service.equals("google");
		
		if(isNaver) {
			this.api20Instance = NaverAPI20.instance();
			this.profileUrls = NAVER_PROFILE_URL;
		
		}else if(isGoogle) {
			this.api20Instance = GoogleApi20.instance();
			this.profileUrls = GOOGLE_PROFILE_URL;
		}
	}
	
	
}
