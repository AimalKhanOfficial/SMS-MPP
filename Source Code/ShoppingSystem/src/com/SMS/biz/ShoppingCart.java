package com.SMS.biz;

import java.util.ArrayList;

public class ShoppingCart {
	private double totalPrice;
	private ArrayList<CartItem> cartItems = null;
	
	public ShoppingCart() {
		// TODO Auto-generated constructor stub
		cartItems = new ArrayList<CartItem>();
	}
	
	public void addCartItem(CartItem cartItem){
		cartItems.add(cartItem);
	}
	
	public double getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
