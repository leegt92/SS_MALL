package edu.bit.ssmall.productVO;

import javax.inject.Inject;

import edu.bit.ssmall.mapper.ProductMapper;

public class ProductVO {

	private int P_number;
	private String P_name;
	private int P_price;
	private String P_brand;
	private int P_stock;
	private String P_description;
	private String P_image;
	private String P_released_date;
	private int P_amount;
	private String P_category;
	
	public int getP_number() {
		return P_number;
	}
	public void setP_number(int p_number) {
		P_number = p_number;
	}
	public String getP_name() {
		return P_name;
	}
	public void setP_name(String p_name) {
		P_name = p_name;
	}
	public int getP_price() {
		return P_price;
	}
	public void setP_price(int p_price) {
		P_price = p_price;
	}
	public String getP_brand() {
		return P_brand;
	}
	public void setP_brand(String p_brand) {
		P_brand = p_brand;
	}
	public int getP_stock() {
		return P_stock;
	}
	public void setP_stock(int p_stock) {
		P_stock = p_stock;
	}
	public String getP_description() {
		return P_description;
	}
	public void setP_description(String p_description) {
		P_description = p_description;
	}
	public String getP_image() {
		return P_image;
	}
	public void setP_image(String p_image) {
		P_image = p_image;
	}
	public String getP_released_date() {
		return P_released_date;
	}
	public void setP_released_date(String p_released_date) {
		P_released_date = p_released_date;
	}
	public int getP_amount() {
		return P_amount;
	}
	public void setP_amount(int p_amount) {
		P_amount = p_amount;
	}
	public String getP_category() {
		return P_category;
	}
	public void setP_category(String p_category) {
		P_category = p_category;
	}
	

	
}
