package edu.bit.ssmall.vo;


import java.sql.Date;
import java.sql.Timestamp;

public class BoardNoticeVO {
	
	 private String bId; 	  // 공지사항 아이디
	 private String bTitle;	  // 공지사항 타이틀
	 private String bName;	  // 공지사항 이름
	 private Date bDate; 	  // 공지사항 날짜
	 private int bHit; 	      // 공지사항 조회수
	 private String bContent; // 공지사항 정보
	 private int bStep; 	  // 공지사항 스텝
	 private int bIndent;	  // 공지사항 인덴트
	 private int bGroup; 	  // 공지사항 그룹
	 private String bType; 	  // 공지사항 타입
	
	 private int bTotalrepot; // 공지사항 누적 신고수
	
	 private int m_number; 	  // 공지사항 회원번호
	 private int p_number; 	  // 공지사항 상품번호
	 
	 private String bAnswered;// 공지사항 답변여부
	 private String bAnswerno;// 공지사항 답변 번호
	 
	 public BoardNoticeVO() {}
	 
	public BoardNoticeVO(String bId, String bTitle, String bName, Date bDate, int bHit, String bContent, int bStep,
			int bIndent, int bGroup, String bType, int bTotalrepot, int m_number, int p_number, String bAnswered,
			String bAnswerno) {
		super();
		this.bId = bId;
		this.bTitle = bTitle;
		this.bName = bName;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bContent = bContent;
		this.bStep = bStep;
		this.bIndent = bIndent;
		this.bGroup = bGroup;
		this.bType = bType;
		this.bTotalrepot = bTotalrepot;
		this.m_number = m_number;
		this.p_number = p_number;
		this.bAnswered = bAnswered;
		this.bAnswerno = bAnswerno;
	}

	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbIndent() {
		return bIndent;
	}
	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public String getbType() {
		return bType;
	}
	public void setbType(String bType) {
		this.bType = bType;
	}
	public int getbTotalrepot() {
		return bTotalrepot;
	}
	public void setbTotalrepot(int bTotalrepot) {
		this.bTotalrepot = bTotalrepot;
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
	public String getbAnswered() {
		return bAnswered;
	}
	public void setbAnswered(String bAnswered) {
		this.bAnswered = bAnswered;
	}
	public String getbAnswerno() {
		return bAnswerno;
	}
	public void setbAnswerno(String bAnswerno) {
		this.bAnswerno = bAnswerno;
	}
	 
	 

	
	
	
}
