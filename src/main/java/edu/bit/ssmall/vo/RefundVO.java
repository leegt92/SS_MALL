package edu.bit.ssmall.vo;

import java.sql.Date;

public class RefundVO {
	private int r_number; //환불번호
	private int m_number; //회원번호
	private int p_number; //상품번호
	private String r_amount; //환불수량
	private String r_price; //환불가격
	private Date r_date; //환불일자
	private String r_status; //환불상태
	private String p_image; // 상품사진
	private String p_name; // 상품명
	private String p_brand; // 상품브랜드
	
	public int getR_number() {
		return r_number;
	}
	public void setR_number(int r_number) {
		this.r_number = r_number;
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
	public String getR_amount() {
		return r_amount;
	}
	public void setR_amount(String r_amount) {
		this.r_amount = r_amount;
	}
	public String getR_price() {
		return r_price;
	}
	public void setR_price(String r_price) {
		this.r_price = r_price;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getR_status() {
		return r_status;
	}
	public void setR_status(String r_status) {
		this.r_status = r_status;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
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
	@Override
	public String toString() {
		return "RefundVO [r_number=" + r_number + ", m_number=" + m_number + ", p_number=" + p_number + ", r_amount="
				+ r_amount + ", r_price=" + r_price + ", r_date=" + r_date + ", r_status=" + r_status + ", p_image="
				+ p_image + ", p_name=" + p_name + ", p_brand=" + p_brand + "]";
	}

	
}
