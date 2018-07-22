package com.SMS.biz;

import java.util.ArrayList;
import java.util.Date;

public class Order {
	private int orderId;
	private Date orderDateTime;
	private ArrayList<Product> products = null;
	
	public Order() {
		// TODO Auto-generated constructor stub
		products = new ArrayList<Product>();
	}
	
	public void addProduct(Product product){
		this.products.add(product);
	}
	
	public ArrayList<Product> getProduct(){
		return this.products;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Date getOrderDateTime() {
		return orderDateTime;
	}
	public void setOrderDateTime(Date orderDateTime) {
		this.orderDateTime = orderDateTime;
	}
	
}
