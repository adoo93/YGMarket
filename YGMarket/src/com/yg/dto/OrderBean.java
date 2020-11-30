package com.yg.dto;

public class OrderBean {
	private int ordernum;
	private int member_id;
	private String code;
//	private int price;
	private int qty;
   
	public OrderBean() {}
   
	public OrderBean(int member_id, String code, int qty) {
		super();
		this.member_id = member_id;
		this.code = code;
		this.qty = qty;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	
}

