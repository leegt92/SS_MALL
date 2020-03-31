package edu.bit.ssmall.kakaopay;

public class ExtrasVO {
	//response 승인요청시 에러 vo
	private String method_result_code; //에러코드
	private String method_result_message; //에러메시지
	
	public String getMethod_result_code() {
		return method_result_code;
	}
	public void setMethod_result_code(String method_result_code) {
		this.method_result_code = method_result_code;
	}
	public String getMethod_result_message() {
		return method_result_message;
	}
	public void setMethod_result_message(String method_result_message) {
		this.method_result_message = method_result_message;
	}
	@Override
	public String toString() {
		return "Extras [method_result_code=" + method_result_code + ", method_result_message=" + method_result_message
				+ "]";
	}
	
	
}
