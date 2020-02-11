package edu.bit.ssmall.vo;

public class RegisterRequest {

	private String m_name; //이름
	private int m_age; //나이
	private String m_email; //이메일
	private String m_adress; //주소
	private String m_phonenum; //핸드폰번호
	private String m_id; //아이디
	private String m_password; //비밀번호
	private String m_checkpassword; //비밀번호확인
	    
	public boolean isEqualsPassword() {
		return m_password.equals(m_checkpassword);
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_age() {
		return m_age;
	}

	public void setM_age(int m_age) {
		this.m_age = m_age;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_adress() {
		return m_adress;
	}

	public void setM_adress(String m_adress) {
		this.m_adress = m_adress;
	}

	public String getM_phonenum() {
		return m_phonenum;
	}

	public void setM_phonenum(String m_phonenum) {
		this.m_phonenum = m_phonenum;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_checkpassword() {
		return m_checkpassword;
	}

	public void setM_checkpassword(String m_checkpassword) {
		this.m_checkpassword = m_checkpassword;
	}
	
	
}
