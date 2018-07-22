package com.SMS.biz;

public class UsersFactory {
	
	
	public User GetUser(UserTypes userType) {
		User user = null;
		if(UserTypes.Customer.equals(userType)) {
			user = new Customer();
			
		}
		else if(UserTypes.Admin.equals(userType)) {
			user = new Admin();
			
		}
		return user;
	}
}
