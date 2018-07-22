package com.SMS.biz;

import java.util.ArrayList;

public class Product {
	private int ProductID;
	private String Name;
	private String Description;
	private double Price;
	private int QuantityAvailable;
	private String CategoryName;
	private ArrayList<ProductImage> Images = null;
	private ArrayList<CustomerReview> CustomerReviews = null;
	
	public ArrayList<CustomerReview> getCustomerReviews() {
		return CustomerReviews;
	}


	public String getCategoryName() {
		return CategoryName;
	}

	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}

	public void setImages(ArrayList<ProductImage> images) {
		Images = images;
	}
	
	public Product() {
		// TODO Auto-generated constructor stub
		Images = new ArrayList<ProductImage>();
		CustomerReviews = new ArrayList<CustomerReview>();
	}
	
	public ArrayList<ProductImage> getImages() {
		return Images;
	}

	public void AddProductImage(ProductImage image) {
		this.Images.add(image);
	}
	
	public void AddProductReview(CustomerReview image) {
		this.CustomerReviews.add(image);
	}

	public int getProductID() {
		return ProductID;
	}

	public void setProductID(int productID) {
		ProductID = productID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public int getQuantityAvailable() {
		return QuantityAvailable;
	}

	public void setQuantityAvailable(int quantityAvailable) {
		QuantityAvailable = quantityAvailable;
	}

}
