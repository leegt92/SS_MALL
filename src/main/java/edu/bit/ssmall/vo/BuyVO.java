package edu.bit.ssmall.vo;

import java.sql.Date;

public class BuyVO {

	private int b_number;
	private int m_number;
	private int p_number;
	private Date b_date;
	private String b_done;
	
	public BuyVO(int b_number, int m_number, int p_number, Date b_date, String b_done) {
		this.b_number = b_number;
		this.m_number = m_number;
		this.p_number = p_number;
		this.b_date = b_date;
		this.b_done = b_done;
	}
	
	public BuyVO() {}
	
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
	public String getB_done() {
		return b_done;
	}
	public void setB_done(String b_done) {
		this.b_done = b_done;
	}
	
	

}
