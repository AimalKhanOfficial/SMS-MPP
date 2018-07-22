package com.SMS.biz;

public abstract class User {
	
	private Long userId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String userTypeId;
	private String verificationCode;
	
	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public String getUserTypeId() {
		return userTypeId;
	}

	public void setUserTypeId(String userTypeId) {
		this.userTypeId = userTypeId;
	}

	public User(Long userId, String firstName, String lastName, String email, String password) {
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
	}
	
	public User() {
		
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public abstract Customer Login(String email, String password);
	
	public abstract boolean ReviewProduct(int userId, int productid, String comment, String createdBy);
	
	public abstract void Logout();
	
	public abstract boolean Register(String firstName, String lastName, String emailAddress, String password, String contactNumber, String shippingAddress);
	
	public abstract boolean contactAdmin(String query, int user_ID);
	
	public abstract boolean subscribeOffersNotifications(int userId, String userName);
	
	public abstract boolean forgetPassword(String emailAddress);
	
	public abstract boolean createCategory(String categoryName);
	
	public abstract int createProduct(String categoryId, String productName,
			String productPrice, String productQuantity, String productDesc, String[] prodImages);
	
	public abstract boolean disableProduct(int productId);
	
	public abstract boolean disableCategory(int categoryId);
	
	public abstract boolean editProduct(int productId, String categoryId, String productName,
			String productPrice, String productQuantity, String productDesc);
	
	public abstract boolean notifyUsersForSale(String emailtext);
	
	public abstract boolean editCategory(int categoryId, String category);
	
}
