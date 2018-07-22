package com.SMS.biz;

import java.util.ArrayList;

import com.SMS.dataAccessLayer.Connector;
import com.SMS.utility.Utility;

public class Admin extends User {

	public Admin(Long userId, String firstName, String lastName, String email,
			String password) {
		super(userId, firstName, lastName, email, password);
	}

	public Admin() {

	}

	@Override
	public Customer Login(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void Logout() {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean subscribeOffersNotifications(int userId, String userName) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean forgetPassword(String password) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public int createProduct(String categoryId, String productName,
			String productPrice, String productQuantity, String productDesc, String[] prodImages) {
		// TODO Auto-generated method stub
		int result = 1;
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int productId = dbCon.createProduct(categoryId, productName, productPrice, productQuantity, productDesc);
			
			if(productId <= 0){
				return 0;
			}
			
			ArrayList<String> images = Utility.SaveImagesToDirectory(prodImages);
			dbCon.AddImagesForProduct(productId, images);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return 0;
		}
		return result;
	}

	@Override
	public boolean disableProduct(int productId) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int results = dbCon.disableProduct(productId);

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
	public boolean editProduct(int productId, String categoryId, String productName,
			String productPrice, String productQuantity, String productDesc) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int results = dbCon.editProduct(productId, categoryId, productName, productPrice, productQuantity, productDesc);

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
	public boolean notifyUsersForSale(String emailtext) {
		// TODO Auto-generated method stub
		
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			ArrayList<String> emailAddresses = dbCon.notifyUsersForOffer();
			
			String[] to = new String[emailAddresses.size()];
			to = emailAddresses.toArray(to);
			
			Utility.SendEmail(to, "New Offers - SMS", emailtext);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return false;
		}		
		return true;
	}

	@Override
	public boolean Register(String firstName, String lastName,
			String emailAddress, String password, String contactNumber,
			String shippingAddress) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean contactAdmin(String query, int user_ID) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean disableCategory(int categoryId) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int results = dbCon.disableCategory(categoryId);

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
	public boolean editCategory(int categoryId, String category) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int results = dbCon.editCategory(categoryId, category);

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
	public boolean createCategory(String categoryName) {
		// TODO Auto-generated method stub
		try {
			// Db_Connection dbCon = new Db_Connection();
			Connector dbCon = new Connector();
			int results = dbCon.createCategory(categoryName);

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
	public boolean ReviewProduct(int userId, int productid, String comment,
			String createdBy) {
		// TODO Auto-generated method stub
		return false;
	}

}
