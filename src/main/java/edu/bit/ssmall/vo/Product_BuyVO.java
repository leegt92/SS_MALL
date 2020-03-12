package edu.bit.ssmall.vo;

import java.sql.Date;

public class Product_BuyVO {

	private int p_number;
	private String p_name;
	private int p_price;
	private String p_brand;
	private int p_stock;
	private String p_description;
	private String p_released_date;
	private int p_amount;
	private String p_category;
	private String p_image;
	private int b_number;
	private int m_number;
	private Date b_date;
	private String b_done;
	private int b_amount;
	
	public Product_BuyVO(int p_number, String p_name, int p_price, String p_brand, int p_stock, String p_description,
			String p_released_date, int p_amount, String p_category, String p_image, int b_number, int m_number, Date b_date, String b_done, int b_amount) {
		this.p_number = p_number;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_brand = p_brand;
		this.p_stock = p_stock;
		this.p_description = p_description;
		this.p_released_date = p_released_date;
		this.p_amount = p_amount;
		this.p_category = p_category;
		this.p_image = p_image;
		this.b_number = b_number;
		this.m_number = m_number;
		this.b_date = b_date;
		this.b_done = b_done;
		this.b_amount = b_amount;
	}
	
	public Product_BuyVO() {};
	
	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

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

	public int getB_amount() {
		return b_amount;
	}

	public void setB_amount(int b_amount) {
		this.b_amount = b_amount;
	}
	
	public int getP_number() {
		return p_number;
	}
	public void setP_number(int p_number) {
		this.p_number = p_number;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public String getP_description() {
		return p_description;
	}
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}

	public String getP_released_date() {
		return p_released_date;
	}
	public void setP_released_date(String p_released_date) {
		this.p_released_date = p_released_date;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}


}
