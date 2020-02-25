package edu.bit.ssmall.vo;

import java.sql.Date;

public class BuyVO {
	private int b_number; //구매번호
	private Date b_date; //구매일자
	private int b_amount; //구매수량
	private int b_total; // 구매총가격
	private String b_status;//구매상태
	private String b_payment; //결제방법
	private int m_number; //회원번호
	private int p_number; //상품번호
	private String p_name; //상품이름
	private int p_price; //상품가격
	private String p_brand; //상품브랜드
	private int p_stock; // 상품재고
	private String p_description; //상품내용
	private String p_released_date; //출시일자
	private int p_amount; //판매량
	private String p_category;	//카테고리 지갑인지 시계인지
	private String i_name; //이미지이름 
	private int i_type;	//이미지타입 메인사진 1
	
	
	public String getB_payment() {
		return b_payment;
	}
	public void setB_payment(String b_payment) {
		this.b_payment = b_payment;
	}
	public int getB_total() {
		return b_total;
	}
	public void setB_total(int b_total) {
		this.b_total = b_total;	
	}
	public int getB_number() {
		return b_number;
	}
	public void setB_number(int b_number) {
		this.b_number = b_number;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public int getB_amount() {
		return b_amount;
	}
	public void setB_amount(int b_amount) {
		this.b_amount = b_amount;
	}
	public String getB_status() {
		return b_status;
	}
	public void setB_status(String b_status) {
		this.b_status = b_status;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public String getP_description() {
		return p_description;
	}
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}
	public String getP_released_date() {
		return p_released_date;
	}
	public void setP_released_date(String p_released_date) {
		this.p_released_date = p_released_date;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public int getI_type() {
		return i_type;
	}
	public void setI_type(int i_type) {
		this.i_type = i_type;
	}
	@Override
	public String toString() {
		return "BuyVO [b_number=" + b_number + ", b_date=" + b_date + ", b_amount=" + b_amount + ", b_total=" + b_total
				+ ", b_status=" + b_status + ", m_number=" + m_number + ", p_number=" + p_number + ", p_name=" + p_name
				+ ", p_price=" + p_price + ", p_brand=" + p_brand + ", p_stock=" + p_stock + ", p_description="
				+ p_description + ", p_released_date=" + p_released_date + ", p_amount=" + p_amount + ", p_category="
				+ p_category + ", i_name=" + i_name + ", i_type=" + i_type + "]";
	}
	
	
	
}
