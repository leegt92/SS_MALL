package edu.bit.ssmall.kakaopay;

import java.sql.Date;

public class KakaoPayCancelVO {
	
	//response 결제취소
	private String aid; //request고유번호
	private String tid; //결제고유번호 10자
	private String cid; //가맹점 코드 20자
	private String status; //결제상태값
	private String partner_order_id; //가맹점 주문번호. 최대100자
	private String partner_user_id; //가맹점 회원id.최대100자
	private String payment_method_type; //결제수단 card or money
	private AmountVO amount; //결제 금액정보
	private AmountVO canceled_amount; //이번요청으로 취소된 금액정보
	private AmountVO cancel_available_amount; //해당결제에대해 취소가능금액
	private String item_name; //상품이름 최대100자
	private String item_code; //상품 코드 최대 100자
	private int quantity; //상품수량
	private Date created_at; //결제준비요청시각
	private Date approved_at; //결제승인시각
	private Date canceled_at; //결제취소시각
	private String payload; //request로 전달한값
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public AmountVO getCanceled_amount() {
		return canceled_amount;
	}
	public void setCanceled_amount(AmountVO canceled_amount) {
		this.canceled_amount = canceled_amount;
	}
	public AmountVO getCancel_available_amount() {
		return cancel_available_amount;
	}
	public void setCancel_available_amount(AmountVO cancel_available_amount) {
		this.cancel_available_amount = cancel_available_amount;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
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
	public Date getCanceled_at() {
		return canceled_at;
	}
	public void setCanceled_at(Date canceled_at) {
		this.canceled_at = canceled_at;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
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
		return "KakaoPayCancelVO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", status=" + status
				+ ", partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", payment_method_type=" + payment_method_type + ", amount=" + amount + ", canceled_amount="
				+ canceled_amount + ", cancel_available_amount=" + cancel_available_amount + ", item_name=" + item_name
				+ ", item_code=" + item_code + ", quantity=" + quantity + ", created_at=" + created_at
				+ ", approved_at=" + approved_at + ", canceled_at=" + canceled_at + ", payload=" + payload + ", extras="
				+ extras + ", code=" + code + ", msg=" + msg + "]";
	}
	
	
	
	
}
