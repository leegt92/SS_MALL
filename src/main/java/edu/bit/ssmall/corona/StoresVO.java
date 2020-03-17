package edu.bit.ssmall.corona;

public class StoresVO {
	private String code;//식별코드
	private String name;//이름
	private String addr;//주소
	private String type;//판매처유형(1약국 2우체국 3농협)
	private double lat;//위도
	private double lng;//경도
	private String stock_at;//입고시간
	private String remain_stat;//재고상태 100개이상 녹색(plenty) 30개이상 100개미만 노랑색(some) 2개이상 30개미만 빨강색(few) 1개이하 회색 (empty) 판매중지 (break)
	private String created_at;//데이터 생성 일자
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getStock_at() {
		return stock_at;
	}
	public void setStock_at(String stock_at) {
		this.stock_at = stock_at;
	}
	public String getRemain_stat() {
		return remain_stat;
	}
	public void setRemain_stat(String remain_stat) {
		this.remain_stat = remain_stat;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	@Override
	public String toString() {
		return "StoresVO [code=" + code + ", name=" + name + ", addr=" + addr + ", type=" + type + ", lat=" + lat
				+ ", lng=" + lng + ", stock_at=" + stock_at + ", remain_stat=" + remain_stat + ", created_at="
				+ created_at + "]";
	}
	
	
	
}
