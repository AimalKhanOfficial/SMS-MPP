package com.SMS.biz;

import java.util.ArrayList;

public class Category {
	private int CategoryID;
	private String Category;
	private ArrayList<Product> Products = null;
	
	public ArrayList<Product> getProducts() {
		return Products;
	}

	public Category(){
		
	}
	
	public Category(int categoryId, String category){
		this.Category = category;
		this.CategoryID = categoryId;
	}
	
	public void AddProduct(Product product){
		this.Products.add(product);
	}

	public int getCategoryID() {
		return CategoryID;
	}

	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	
}
