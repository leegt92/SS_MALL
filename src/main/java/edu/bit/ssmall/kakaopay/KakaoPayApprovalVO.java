package edu.bit.ssmall.kakaopay;

import java.sql.Date;

public class KakaoPayApprovalVO {
	
	//response(결제승인) 
    private String aid; //request 고유번호
    private String tid; //결제고유번호 
    private String cid; //가맹점코드
    private String sid; // 정기결제 cid로 결제요청한 경우 발급
    private String partner_order_id; //가맹점 주문번호
    private String partner_user_id; //가맹점 회원아이디
    private String payment_method_type; //결제수단
    private AmountVO amount; //결제금액정보 object객체로 들어옴
    private CardVO card_info; //결제상세정보  object객체로들어옴
    private String item_name; //상품이름 최대100자
    private String item_code; //상쿰코드 최대100자
    private String payload; //reqeust로 전달한값
    private Integer quantity; //상품 수량
    private Date created_at;  //결제준비요청시각
    private Date approved_at; //결제승인시각
    private ExtrasVO extras; //실패정보
    private String code; //에러코드
    private String msg; //에러메시지
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	public AmountVO getAmount() {
		return amount;
	}
	public void setAmount(AmountVO amount) {
		this.amount = amount;
	}
	public CardVO getCard_info() {
		return card_info;
	}
	public void setCard_info(CardVO card_info) {
		this.card_info = card_info;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}
	public ExtrasVO getExtras() {
		return extras;
	}
	public void setExtras(ExtrasVO extras) {
		this.extras = extras;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "KakaoPayApprovalVO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", sid=" + sid
				+ ", partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", payment_method_type=" + payment_method_type + ", amount=" + amount + ", card_info=" + card_info
				+ ", item_name=" + item_name + ", item_code=" + item_code + ", payload=" + payload + ", quantity="
				+ quantity + ", created_at=" + created_at + ", approved_at=" + approved_at + ", extras=" + extras
				+ ", code=" + code + ", msg=" + msg + "]";
	}
	
    
   
}
