package edu.bit.ssmall.iamport;

public class PaymentInfoVO {
	private String code;
	private String message;
	private PaymentVO response;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public PaymentVO getResponse() {
		return response;
	}
	public void setResponse(PaymentVO response) {
		this.response = response;
	}
	@Override
	public String toString() {
		return "PaymentInfoVO [code=" + code + ", message=" + message + ", response=" + response + "]";
	}
	
	
}
