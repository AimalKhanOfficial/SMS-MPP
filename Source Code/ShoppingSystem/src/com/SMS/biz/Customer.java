package com.SMS.biz;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.SMS.dataAccessLayer.Connector;
import com.SMS.utility.Utility;

public class Customer extends User {

	private String shippingAddress;
	private String contactNumber;
	private Boolean isAccVerified;
	private List<Order> orders;
	private ShoppingCart cart;

	public Customer(Long userId, String firstName, String lastName,
			String email, String password) {
		super(userId, firstName, lastName, email, password);
	}
	
	public void setShoppingCart(ShoppingCart shoppingCart){
		this.cart = shoppingCart;
	}
	
	public ShoppingCart getShoppingCart(){
		return this.cart;
	}

	public Customer() {

	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Boolean getIsAccVerified() {
		return isAccVerified;
	}

	public void setIsAccVerified(Boolean isAccVerified) {
		this.isAccVerified = isAccVerified;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	@Override
	public Customer Login(String email, String password) {
		// TODO Auto-generated method stub
		Customer customer = null;
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			customer = dbCon.loginCustomer(email, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return customer;
		}
		return customer;
	}

	@Override
	public void Logout() {
		// TODO Auto-generated method stub

	}


	@Override
	public boolean subscribeOffersNotifications(int userId, String userName) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int results = dbCon.subscribeToNotifications(userId, userName);

			if (results > 0) {
				return true;
			}

				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return false;
		}
		return false;
	}

	@Override
	public boolean forgetPassword(String emailAddress) {
		// TODO Auto-generated method stub
		
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int newPassword = Utility.GenerateVerificationCode();
			int result = dbCon.recoverPassword(newPassword, emailAddress);
			
			if(result > 0){
				Utility.SendEmail(new String[]{emailAddress}, "Password Reset", "Hello, use " + newPassword + " as your new password to login to SMS. Thank you!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return false;
		}
		return true;
	}

	@Override
	public boolean createCategory(String categoryName){
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int createProduct(String categoryId, String productName,
			String productPrice, String productQuantity, String productDesc, String[] prodImages){
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean disableProduct(int productId) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean editProduct(int productId, String categoryId, String productName,
			String productPrice, String productQuantity, String productDesc) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean notifyUsersForSale(String emailtext) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editCategory(int categoryId, String category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Register(String firstName, String lastName,
			String emailAddress, String password, String contactNumber,
			String shippingAddress) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			String verificationCode = Utility.GenerateVerificationCode() + "";
			int results = dbCon.registerUser(firstName, lastName, emailAddress,
					password, contactNumber, shippingAddress, verificationCode);

			if (results > 0) {
				Utility.SendEmail(new String[] { emailAddress },
						"Email Verification", "Hey there " + firstName
								+ ", Use this verification code: "
								+ verificationCode
								+ " on first login. Thank you!");
			}

				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return false;
		}
		return true;
		
	}

	@Override
	public boolean contactAdmin(String query, int user_ID) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int results = dbCon.contactAdmin(query, user_ID);

			if (results > 0) {
				return true;
			}

				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return false;
		}
		return true;
	}

	@Override
	public boolean disableCategory(int categoryId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean ReviewProduct(int userId, int productid, String comment,
			String createdBy) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int results = dbCon.reviewProduct(userId, productid, comment, createdBy);

			if (results > 0) {
				return true;
			}

				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return false;
		}
		return false;
	}

}
