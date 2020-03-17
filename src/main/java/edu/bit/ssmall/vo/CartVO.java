package edu.bit.ssmall.vo;

public class CartVO {
	private String c_id; //카트번호
	private int m_number; //회원번호
	private int p_number; //상품번호
	private int c_amount; //구매수량
	private int c_totalprice; //가격	
	private int c_grandtotal;//카트에 담긴 총가격
	
	
	
	@Override
	public String toString() {
		return "CartVO [c_id=" + c_id + ", m_number=" + m_number + ", p_number=" + p_number + ", c_amount=" + c_amount
				+ ", c_totalprice=" + c_totalprice + ", c_grandtotal=" + c_grandtotal + "]";
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
	public int getC_totalprice() {
		return c_totalprice;
	}
	public void setC_totalprice(int c_totalprice) {
		this.c_totalprice = c_totalprice;
	}
	public int getC_grandtotal() {
		return c_grandtotal;
	}
	public void setC_grandtotal(int c_grandtotal) {
		this.c_grandtotal = c_grandtotal;
	}
	
}
