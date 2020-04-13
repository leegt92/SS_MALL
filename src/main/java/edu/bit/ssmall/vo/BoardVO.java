package edu.bit.ssmall.vo;

import java.sql.Date;

public class BoardVO {

	private String bid;
	private String btitle;
	private String bname;
	private Date bdate;
	private int bhit;
	private String bcontent;
	private int bstep;
	private int bindent;
	private int bgroup;
	private String btype;
	private int btotalrepot;
	private int m_number;
	private String banswerno;
	private String banswered;
	
	public BoardVO() {}
	
	public BoardVO(String bid, String btitle, String bname, Date bdate, int bhit, String bcontent, int bstep,
			int bindent, int bgroup, String btype, int btotalrepot, int m_number, String banswerno,
			String banswered) {
		super();
		this.bid = bid;
		this.btitle = btitle;
		this.bname = bname;
		this.bdate = bdate;
		this.bhit = bhit;
		this.bcontent = bcontent;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bgroup = bgroup;
		this.btype = btype;
		this.btotalrepot = btotalrepot;
		this.m_number = m_number;
		this.banswerno = banswerno;
		this.banswered = banswered;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
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
	public int getBtotalrepot() {
		return btotalrepot;
	}
	public void setBtotalrepot(int btotalrepot) {
		this.btotalrepot = btotalrepot;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public String getBanswerno() {
		return banswerno;
	}
	public void setBanswerno(String banswerno) {
		this.banswerno = banswerno;
	}
	public String getBanswered() {
		return banswered;
	}
	public void setBanswered(String banswered) {
		this.banswered = banswered;
	}
	@Override
	public String toString() {
		return "BoardVO [bid=" + bid + ", btitle=" + btitle + ", bname=" + bname + ", bdate=" + bdate + ", bhit=" + bhit
				+ ", bcontent=" + bcontent + ", bstep=" + bstep + ", bindent=" + bindent + ", bgroup=" + bgroup
				+ ", btype=" + btype + ", btotalrepot=" + btotalrepot + ", m_number="
				+ m_number + ", banswerno=" + banswerno + ", banswered=" + banswered + "]";
	}
	
	
}
