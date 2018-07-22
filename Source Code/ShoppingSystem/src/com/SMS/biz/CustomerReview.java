package com.SMS.biz;

public class CustomerReview {
	private int CRID;
	private User userDetails;
	private String comment;
	private String createdAt;
	
	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public CustomerReview() {
		// TODO Auto-generated constructor stub
		userDetails = new Customer();
	}
	
	public int getCRID() {
		return CRID;
	}

	public void setCRID(int reviewId) {
		this.CRID = reviewId;
	}

	public User getUserDetails() {
		return userDetails;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
