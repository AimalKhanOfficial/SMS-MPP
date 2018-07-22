package com.SMS.biz;

public class ProductImage {
	private int ImageID;
	private String ImageURL;

	public ProductImage() {
		// TODO Auto-generated constructor stub
	}

	public ProductImage(int imageId, String imageURL) {
		// TODO Auto-generated constructor stub
		this.ImageID = imageId;
		this.ImageURL = imageURL;
	}

	public int getImageID() {
		return ImageID;
	}

	public void setImageID(int imageID) {
		ImageID = imageID;
	}

	public String getImageURL() {
		return ImageURL;
	}

	public void setImageURL(String imageURL) {
		ImageURL = imageURL;
	}

}
