package edu.bit.ssmall.vo;

public class CartViewVO {
	
	private String c_id; //카트번호
	private int m_number; //회원번호
	private int p_number; //상품번호
	private int c_amount; //구매수량	
	private int c_grandtotal;//구매 총가격
	private String p_description;
	private String p_name;
	private String p_brand;
	private String i_name; //이미지
	private String m_name; //이름

	
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	public String getP_description() {
		return p_description;
	}
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public int getP_number() {
		return p_number;
	}
	public void setP_number(int p_number) {
		this.p_number = p_number;
	}
	public int getC_amount() {
		return c_amount;
	}
	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}
	
	public int getC_grandtotal() {
		return c_grandtotal;
	}
	public void setC_grandtotal(int c_grandtotal) {
		this.c_grandtotal = c_grandtotal;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	@Override
	public String toString() {
		return "CartViewVO [c_id=" + c_id + ", m_number=" + m_number + ", p_number=" + p_number + ", c_amount="
				+ c_amount + ", c_grandtotal=" + c_grandtotal + ", p_description=" + p_description + ", p_name="
				+ p_name + ", p_brand=" + p_brand + ", i_name=" + i_name + ", m_name=" + m_name + "]";
	}

	
}
