package edu.bit.ssmall.vo;

public class PayVO {
	private String name ; //수령자
	private String phonenum ; //수령자 핸드폰
	private String addr; //수령자 주소
	private String memo; //배송 메시지 
	private String p_name; //구매하는 상품명
	private String amount; //총 구매수량
	private int totalPrice; // 구매하는 가격
	
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	@Override
	public String toString() {
		return "PayVO [name=" + name + ", phonenum=" + phonenum + ", addr=" + addr + ", memo=" + memo 
				 + ", p_name=" + p_name + ", amount=" + amount + ", totalPrice=" + totalPrice + "]";
	}
	


	
}
