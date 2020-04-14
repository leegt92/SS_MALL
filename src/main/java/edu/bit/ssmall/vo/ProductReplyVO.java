package edu.bit.ssmall.vo;

import java.sql.Date;

public class ProductReplyVO {

	private int bid;
	private String btitle;
	private String bname;
	private Date bdate;
	private int bhit;
	private String bcontent;
	private int bstep;
	private int bindent;
	private int bgroup;
	private String btype;
	private int BTOTALREPOT;
	private int m_number;
	private String p_number;
	private String m_id;
	private int brepotid1;
	private int brepotid2;
	
	public int getBrepotid1() {
		return brepotid1;
	}
	public void setBrepotid1(int brepotid1) {
		this.brepotid1 = brepotid1;
	}
	public int getBrepotid2() {
		return brepotid2;
	}
	public void setBrepotid2(int brepotid2) {
		this.brepotid2 = brepotid2;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public int getBindent() {
		return bindent;
	}
	public void setBindent(int bindent) {
		this.bindent = bindent;
	}
	public int getBgroup() {
		return bgroup;
	}
	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public int getBTOTALREPOT() {
		return BTOTALREPOT;
	}
	public void setBTOTALREPOT(int bTOTALREPOT) {
		BTOTALREPOT = bTOTALREPOT;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public String getP_number() {
		return p_number;
	}
	public void setP_number(String p_number) {
		this.p_number = p_number;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
}
