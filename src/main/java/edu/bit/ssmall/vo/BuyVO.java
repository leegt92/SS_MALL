package edu.bit.ssmall.vo;

import java.sql.Date;

public class BuyVO {
	
	private int b_number; //구매번호
	private int m_number; //회원번호
	private int p_number; //상품번호
	private Date b_date; //구매일자	
	private int b_amount; //구매수량
	private String b_status; //구매수량
	private int b_total; // 구매총가격
	private String b_kakao_tid; //카카오페이 결제고유번호
	private String b_memo; //배송메시지
	private String b_name; //수령인
	private String b_phonenum;//수령인 전화번호
	private String b_addr;//수령받을 주소
	
	public int getB_number() {
		return b_number;
	}
	public void setB_number(int b_number) {
		this.b_number = b_number;
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
	public int getB_total() {
		return b_total;
	}
	public void setB_total(int b_total) {
		this.b_total = b_total;
	}
	public String getB_kakao_tid() {
		return b_kakao_tid;
	}
	public void setB_kakao_tid(String b_kakao_tid) {
		this.b_kakao_tid = b_kakao_tid;
	}
	public String getB_memo() {
		return b_memo;
	}
	public void setB_memo(String b_memo) {
		this.b_memo = b_memo;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_phonenum() {
		return b_phonenum;
	}
	public void setB_phonenum(String b_phonenum) {
		this.b_phonenum = b_phonenum;
	}
	public String getB_addr() {
		return b_addr;
	}
	public void setB_addr(String b_addr) {
		this.b_addr = b_addr;
	}
	@Override
	public String toString() {
		return "BuyVO [b_number=" + b_number + ", m_number=" + m_number + ", p_number=" + p_number + ", b_date="
				+ b_date + ", b_amount=" + b_amount + ", b_status=" + b_status + ", b_total=" + b_total
				+ ", b_kakao_tid=" + b_kakao_tid + ", b_memo=" + b_memo + ", b_name=" + b_name + ", b_phonenum="
				+ b_phonenum + ", b_addr=" + b_addr + "]";
	}
	
	
}
