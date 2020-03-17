package edu.bit.ssmall.kakaopay;

import java.sql.Date;

public class KakaoPayReadyVO {
	
	//response 받기위한것 결제준비
	//안드로이드, 애플도 응답오는데 웹이라 안받았음.	
    private String tid; //결제고유번호 20자
    private String next_redirect_pc_url; //요청한 클라이언트가 pc웹일경우 redirect. 카카오톡으로 tms를 보내기 위한 사용자입력화면으로 redirect
    private Date created_at; //결제 준비 요청시간
	private Integer code; //에러코드
	private String msg; //에러메시지
	
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	@Override
	public String toString() {
		return "KakaoPayReadyVO [tid=" + tid + ", next_redirect_pc_url=" + next_redirect_pc_url + ", created_at="
				+ created_at + ", code=" + code + ", msg=" + msg + "]";
	}

    
}
