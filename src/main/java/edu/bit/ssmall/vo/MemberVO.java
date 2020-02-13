package edu.bit.ssmall.vo;

public class MemberVO {

	private int m_number;
	private String m_name; //이름
	private int m_age; //나이
	private String m_email; //이메일
	private String m_adress; //주소
	private String m_phonenum; //핸드폰번호
	private String m_receive_email; //이메일 수신여부
	private String m_authority; // 권한
	private String m_id; //아이디
	private String m_password; //비밀번호
	private String m_checkpassword; //비밀번호확인
	private int m_price; // 지금까지 구매한 총금액
	private int m_enabled; // 활성화 여부

	public boolean isEqualsPassword() {
		return m_password.equals(m_checkpassword);
	}

	public String getM_checkpassword() {
		return m_checkpassword;
	}

	public void setM_checkpassword(String m_checkpassword) {
		this.m_checkpassword = m_checkpassword;
	}

	
	public String getM_receive_email() {
		return m_receive_email;
	}
	public void setM_receive_email(String m_receive_email) {
		this.m_receive_email = m_receive_email;
	}
	
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
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
	
	public String getM_authority() {
		return m_authority;
	}
	public void setM_authority(String m_authority) {
		this.m_authority = m_authority;
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
	public int getM_price() {
		return m_price;
	}
	public void setM_price(int m_price) {
		this.m_price = m_price;
	}
	public int getM_enabled() {
		return m_enabled;
	}
	public void setM_enabled(int m_enabled) {
		this.m_enabled = m_enabled;
	}

}
