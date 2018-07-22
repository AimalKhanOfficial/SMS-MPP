package com.SMS.dataAccessLayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import com.SMS.biz.Category;
import com.SMS.biz.Customer;
import com.SMS.biz.CustomerReview;
import com.SMS.biz.Product;
import com.SMS.biz.ProductImage;
import com.SMS.utility.Utility;

public class Connector {

	static final String DB_URL = "jdbc:mysql://localhost/sms";
	static final String USER = "root";
	static final String PASS = "";
	Connection conn = null;
	Statement stmt = null;

	public Connector() throws Exception {
	}

	public int registerUser(String firstName, String lastName,
			String emailAddress, String password, String contactNumber,
			String shippingAddress, String verificationCode) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;

		String sql = "INSERT INTO users(" + "FirstName," + "LastName,"
				+ "UserType_ID," + "EmailAddress," + "Password,"
				+ "ShippingAddress," + "ContactNumber," + "IsAccVerified,"
				+ "VerificationCode," + "CreatedBy," + "CreatedAt,"
				+ "UpdatedBy," + "UpdatedAt," + "IsActive) "

				+ "VALUES (" + "?," // firstName
				+ "?," // lastName
				+ "?," // userTypeId
				+ "?," // EmailAddress
				+ "?," // Password
				+ "?," // ShippingAddress
				+ "?," // ContactNumber
				+ "?," // IsAccVerified
				+ "?," // VerificationCode
				+ "?," // CreatedBy
				+ "?," // CreatedAt
				+ "?," // UpdatedBy
				+ "?," // UpdatedAt
				+ "?)"; // IsActive

		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, firstName);
		preparedStatement.setString(2, lastName);
		preparedStatement.setInt(3, 2);
		preparedStatement.setString(4, emailAddress);
		preparedStatement.setString(5, password);
		preparedStatement.setString(6, shippingAddress);
		preparedStatement.setString(7, contactNumber);
		preparedStatement.setInt(8, 0);
		preparedStatement.setString(9, verificationCode);
		preparedStatement.setString(10, firstName + " " + lastName);
		preparedStatement.setString(11, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setString(12, "");
		preparedStatement.setString(13, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setInt(14, 1);
		int result = preparedStatement.executeUpdate();

		conn.close();
		System.out.println("Result" + result);
		return result;

	}

	public int contactAdmin(String query, int user_ID) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;

		String sql = "INSERT INTO customerqueries(Query," + "User_ID,"
				+ "IsActive," + "CreatedBy," + "CreatedAt," + "UpdatedBy,"
				+ "UpdatdedAt) "

				+ "VALUES (" + "?," // Query
				+ "?," // User_ID
				+ "?," // IsActive
				+ "?," // CreatedBy
				+ "?," // CreatedAt
				+ "?," // UpdatedBy
				+ "?)"; // UpdatdedAt

		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, query);
		preparedStatement.setInt(2, user_ID);
		preparedStatement.setInt(3, 0);
		preparedStatement.setString(4, "From Session");
		preparedStatement.setString(5, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setString(6, "");
		preparedStatement.setString(7, Utility.GetCurrentDateTimeForDB());

		int result = preparedStatement.executeUpdate();

		conn.close();
		System.out.println("Result" + result);
		return result;

	}
	
	public int reviewProduct(int userId, int productId, String comment, String createdBy) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;

		String sql = "INSERT INTO customerreviews(User_ID, Product_ID, Comment, IsActive, CreatedBy, CreatedAt, UpdatedBy, UpdatedAt)"

				+ "VALUES (" + "?," // User_ID
				+ "?," // Product_ID
				+ "?," // Comment
				+ "?," // IsActive
				+ "?," // CreatedBy
				+ "?," // CreatedAt
				+ "?," // UpdatedBy
				+ "?)"; // UpdatdedAt

		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, userId);
		preparedStatement.setInt(2, productId);
		preparedStatement.setString(3, comment);
		preparedStatement.setInt(4, 1);
		preparedStatement.setString(5, createdBy);
		preparedStatement.setString(6, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setString(7, "");
		preparedStatement.setString(8, Utility.GetCurrentDateTimeForDB());

		int result = preparedStatement.executeUpdate();

		conn.close();
		System.out.println("Result" + result);
		return result;
	}

	public void AddImagesForProduct(int productId, ArrayList<String> images)
			throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		PreparedStatement preparedStatement = null;

		for (String imageURL : images) {
			String sql = "INSERT INTO productimages(URL,Product_ID, IsActive, CreatedBy, CreatedAt, UpdatedBy, UpdatedAt)"

					+ "VALUES (" + "?," // Query
					+ "?," // User_ID
					+ "?," // IsActive
					+ "?," // CreatedBy
					+ "?," // CreatedAt
					+ "?," // UpdatedBy
					+ "?)"; // UpdatdedAt
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, imageURL);
			preparedStatement.setInt(2, productId);
			preparedStatement.setInt(3, 1);
			preparedStatement.setString(4, "From Session");
			preparedStatement.setString(5, Utility.GetCurrentDateTimeForDB());
			preparedStatement.setString(6, "");
			preparedStatement.setString(7, Utility.GetCurrentDateTimeForDB());
			int result = preparedStatement.executeUpdate();
		}
		conn.close();
	}

	public int createProduct(String categoryId, String productName,
			String productPrice, String productQuantity, String productDesc)
			throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		PreparedStatement preparedStatement = null;

		String sql = "INSERT INTO products (Category_ID," + "Name,"
				+ "Description, " + "Price, " + "QuantitiyAvailable, "
				+ "IsActive, " + "CreatedAt, " + "CreatedBy, " + "UpdatedBy, "
				+ "UpdatdeAt) "

				+ "VALUES (" + "?," // Query
				+ "?," // User_ID
				+ "?," // IsActive
				+ "?," // CreatedBy
				+ "?," // CreatedAt
				+ "?," // UpdatedBy
				+ "?," // UpdatedBy
				+ "?," // UpdatedBy
				+ "?," // UpdatedBy
				+ "?)"; // UpdatdedAt

		preparedStatement = conn.prepareStatement(sql,
				Statement.RETURN_GENERATED_KEYS);
		preparedStatement.setInt(1, Integer.parseInt(categoryId));
		preparedStatement.setString(2, productName);
		preparedStatement.setString(3, productDesc);
		preparedStatement.setDouble(4, Double.parseDouble(productPrice));
		preparedStatement.setInt(5, Integer.parseInt(productQuantity));
		preparedStatement.setInt(6, 1);
		preparedStatement.setString(7, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setString(8, "Admin");
		preparedStatement.setString(9, "");
		preparedStatement.setString(10, Utility.GetCurrentDateTimeForDB());

		// LAST INSERTED PRODUCT ID
		/*
		 * int numero = preparedStatement.executeUpdate(sql,
		 * Statement.RETURN_GENERATED_KEYS);
		 */
		int result = 0;
		preparedStatement.execute();
		ResultSet rs = preparedStatement.getGeneratedKeys();
		if (rs.next()) {
			result = rs.getInt(1);
		}

		conn.close();

		return result;

	}

	public int createCategory(String categoryName) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;

		String sql = "INSERT INTO categories(Category," + "IsActive,"
				+ "CreatedBy," + "CreatedAt," + "UpdatedBy," + "UpdatedAt) "

				+ "VALUES (?," // Category
				+ "?," // IsActive
				+ "?," // CreatedBy
				+ "?," // CreatedAt
				+ "?," // UpdatedBy
				+ "?)"; // UpdatdedAt

		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, categoryName);
		preparedStatement.setInt(2, 1);
		preparedStatement.setString(3, "From Session");
		preparedStatement.setString(4, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setString(5, "");
		preparedStatement.setString(6, Utility.GetCurrentDateTimeForDB());

		int result = preparedStatement.executeUpdate();

		conn.close();
		System.out.println("Result" + result);
		return result;

	}
	
	public int subscribeToNotifications(int userId, String fullName) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;

		String sql = "INSERT INTO `CustomerOfferSubscriptions`(`User_ID`, `IsActive`, `CreatedBy`, `CreatedAt`, `UpdatedBy`, `UpdatedAt`)"

				+ "VALUES (?," // User_ID
				+ "?," // IsActive
				+ "?," // CreatedBy
				+ "?," // CreatedAt
				+ "?," // UpdatedBy
				+ "?)"; // UpdatdedAt

		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, userId);
		preparedStatement.setInt(2, 1);
		preparedStatement.setString(3, fullName);
		preparedStatement.setString(4, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setString(5, "");
		preparedStatement.setString(6, Utility.GetCurrentDateTimeForDB());

		int result = preparedStatement.executeUpdate();

		conn.close();
		System.out.println("Result" + result);
		return result;

	}

	public int disableCategory(int categoryID) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;
		String sql = "UPDATE `categories` SET `IsActive`=?,`UpdatedBy`=?,`UpdatedAt`=? WHERE `CategoryID` = ?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, 0);
		preparedStatement.setString(2, "Admin Name");
		preparedStatement.setString(3, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setInt(4, categoryID);

		int result = preparedStatement.executeUpdate();

		conn.close();
		return result;
	}

	public int disableProduct(int productID) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;
		String sql = "UPDATE `products` SET `IsActive`=?,`UpdatedBy`=?,`UpdatdeAt`=? WHERE `ProductID` = ?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, 0);
		preparedStatement.setString(2, "Admin Name");
		preparedStatement.setString(3, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setInt(4, productID);

		int result = preparedStatement.executeUpdate();

		conn.close();
		return result;
	}
	
	
	public int editProduct(int productId, String categoryId, String productName,
			String productPrice, String productQuantity, String productDesc) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;
		String sql = "UPDATE `products` SET Category_ID = ?, Name=?, Description=?, Price=?, QuantitiyAvailable=?, `UpdatedBy`=?,`UpdatdeAt`=? WHERE `ProductID` = ?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, Integer.parseInt(categoryId));
		preparedStatement.setString(2, productName);
		preparedStatement.setString(3, productDesc);
		preparedStatement.setString(4, productPrice);
		preparedStatement.setString(5, productQuantity);
		preparedStatement.setString(6, "Admin");
		preparedStatement.setString(7, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setInt(8, productId);

		int result = preparedStatement.executeUpdate();

		conn.close();
		return result;
	}

	public int recoverPassword(int newPassword, String emailAddress)
			throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;

		String sql = "UPDATE users SET Password=?, UpdatedBy=?, UpdatedAt=? WHERE EmailAddress=?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, newPassword + "");
		preparedStatement.setString(2, "Admin Name");
		preparedStatement.setString(3, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setString(4, emailAddress);

		int result = preparedStatement.executeUpdate();

		conn.close();
		return result;

	}

	public int acticateUserAcc(int userId, String fullName) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;

		String sql = "UPDATE users SET IsAccVerified=?, UpdatedBy=?, UpdatedAt=? WHERE UserID=?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, 1);
		preparedStatement.setString(2, fullName);
		preparedStatement.setString(3, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setInt(4, userId);

		int result = preparedStatement.executeUpdate();

		conn.close();
		return result;

	}

	public int editCategory(int categoryId, String categoryName)
			throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		PreparedStatement preparedStatement = null;

		String sql = "UPDATE `categories` SET `Category`=?,`UpdatedBy`=?,`UpdatedAt`=? WHERE `CategoryID` = ?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, categoryName);
		preparedStatement.setString(2, "Admin Name");
		preparedStatement.setString(3, Utility.GetCurrentDateTimeForDB());
		preparedStatement.setInt(4, categoryId);

		int result = preparedStatement.executeUpdate();

		conn.close();
		return result;

	}

	public boolean checkIfEmailExists(String emailAddress) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("SELECT * FROM `users` WHERE `EmailAddress` = '"
							+ emailAddress.trim() + "' and `IsActive` = 1");
			rs = preparedStatement.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("Error in getCategories" + e);
		}
		return false;
	}
	
	
	public boolean checkIfSubscribedToOffersNotifications(int userId) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("SELECT * FROM `CustomerOfferSubscriptions` WHERE `IsActive` = 1 and `User_ID` = "
							+ userId);
			rs = preparedStatement.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("Error in checkIfSubscribed" + e);
		}
		return false;
	}
	
	public int getCustomersCount() {
		int count = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("select * from users WHERE UserType_ID = 2");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("Error in getCustomersCount" + e);
		}
		return count;
	}
	
	public int getCustomerQueries() {
		int count = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("SELECT * FROM `customerqueries`");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("Error in getCustomerQueries" + e);
		}
		return count;
	}

	public int getNumberOfSubscriptions() {
		int count = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("SELECT * FROM `customeroffersubscriptions`");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("Error in getCustomerQueries" + e);
		}
		return count;
	}
	
	public ArrayList<String> notifyUsersForOffer() {
		
		ArrayList<String> emailAddresses = new ArrayList<String>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("SELECT y.EmailAddress FROM `customeroffersubscriptions` x join users y on x.user_Id = y.UserID where y.IsActive = 1");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				emailAddresses.add(rs.getString("EmailAddress"));
			}
		} catch (Exception e) {
			System.out.println("Error in notifyUsersForOffer" + e);
		}
		return emailAddresses;
	}
	
	public int getNumberOfCustomerReviews() {
		int count = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("SELECT * FROM `customerreviews`");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("Error in getCustomerQueries" + e);
		}
		return count;
	}
	
	public Customer loginCustomer(String emailAddress, String password) {
		Customer customer = null;
		password = password.replace("'", "");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("select * from users WHERE EmailAddress = '"
							+ emailAddress
							+ "' and Password = '"
							+ password
							+ "'");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				customer = new Customer();
				customer.setUserId(Long.parseLong(rs.getString("UserID")));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setLastName(rs.getString("LastName"));
				customer.setUserTypeId(rs.getString("UserType_ID"));
				customer.setEmail(rs.getString("EmailAddress"));
				customer.setPassword(rs.getString("Password"));
				customer.setShippingAddress(rs.getString("ShippingAddress"));
				customer.setContactNumber(rs.getString("ContactNumber"));
				customer.setIsAccVerified(Utility.convertToBoolean(rs
						.getString("IsAccVerified")));
				customer.setVerificationCode(rs.getString("VerificationCode"));
			}
		} catch (Exception e) {
			System.out.println("Error in loginUser" + e);
		}
		return customer;
	}

	public ArrayList<Category> getCategories() {

		ArrayList<Category> categories = new ArrayList<Category>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("select `CategoryID`,`Category` FROM `categories` WHERE isActive = 1");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Category cat = new Category();
				cat.setCategoryID(Integer.parseInt(rs.getString("CategoryID")));
				cat.setCategory(rs.getString("Category"));
				categories.add(cat);
			}
		} catch (Exception e) {
			System.out.println("Error in getCategories" + e);
		}
		return categories;
	}
	
	public ArrayList<Product> getProductsPerCategoryId(int categoryId) {

		String sql = "";
		
		if(categoryId == 0){
			sql = "SELECT x.ProductID,x.Name,x.Description,x.Price,x.QuantitiyAvailable, y.category FROM products x join categories y on x.Category_ID = y.CategoryID where x.IsActive = 1  order by x.CreatedAt desc";
		}
		else {
			sql = "SELECT x.ProductID,x.Name,x.Description,x.Price,x.QuantitiyAvailable, y.category FROM products x join categories y on x.Category_ID = y.CategoryID where x.IsActive = 1 and Category_ID = "+ categoryId +" order by x.CreatedAt desc";
		}
		
		ArrayList<Product> products = new ArrayList<Product>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;

			ResultSet rsForImages = null;

			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Product prod = new Product();
				prod.setProductID(Integer.parseInt(rs.getString("ProductID")));
				prod.setName(rs.getString("Name"));
				prod.setDescription(rs.getString("Description"));
				prod.setPrice(Double.parseDouble(rs.getString("Price")));
				prod.setQuantityAvailable(Integer.parseInt(rs
						.getString("QuantitiyAvailable")));
				prod.setCategoryName(rs.getString("category"));

				preparedStatement = conn
						.prepareStatement("SELECT * FROM productimages WHERE IsActive = 1 and Product_ID = "
								+ prod.getProductID());
				rsForImages = preparedStatement.executeQuery();

				while (rsForImages.next()) {
					ProductImage prodImage = new ProductImage();
					prodImage.setImageID(Integer.parseInt(rsForImages
							.getString("ImageID")));
					prodImage.setImageURL(rsForImages.getString("URL"));
					prod.AddProductImage(prodImage);
				}

				products.add(prod);
			}
		} catch (Exception e) {
			System.out.println("Error in getCategories" + e);
		}
		return products;
	}

	public ArrayList<Product> getProducts() {

		ArrayList<Product> products = new ArrayList<Product>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;

			ResultSet rsForImages = null;

			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("SELECT x.ProductID,x.Name,x.Description,x.Price,x.QuantitiyAvailable, y.category FROM products x join categories y on x.Category_ID = y.CategoryID where x.IsActive = 1  order by x.CreatedAt desc");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Product prod = new Product();
				prod.setProductID(Integer.parseInt(rs.getString("ProductID")));
				prod.setName(rs.getString("Name"));
				prod.setDescription(rs.getString("Description"));
				prod.setPrice(Double.parseDouble(rs.getString("Price")));
				prod.setQuantityAvailable(Integer.parseInt(rs
						.getString("QuantitiyAvailable")));
				prod.setCategoryName(rs.getString("category"));

				preparedStatement = conn
						.prepareStatement("SELECT * FROM productimages WHERE IsActive = 1 and Product_ID = "
								+ prod.getProductID());
				rsForImages = preparedStatement.executeQuery();

				while (rsForImages.next()) {
					ProductImage prodImage = new ProductImage();
					prodImage.setImageID(Integer.parseInt(rsForImages
							.getString("ImageID")));
					prodImage.setImageURL(rsForImages.getString("URL"));
					prod.AddProductImage(prodImage);
				}

				products.add(prod);
			}
		} catch (Exception e) {
			System.out.println("Error in getCategories" + e);
		}
		return products;
	}

	public Product getProductDetails(int productId) {
		Product prod = new Product();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResultSet rs = null;
			ResultSet rsForImages = null;
			ResultSet rsForComments = null;

			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement preparedStatement = null;
			preparedStatement = conn
					.prepareStatement("SELECT x.ProductID,x.Name,x.Description,x.Price,x.QuantitiyAvailable, y.category FROM products x join categories y on x.Category_ID = y.CategoryID where x.IsActive = 1 and x.ProductID="
							+ productId);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				prod.setProductID(Integer.parseInt(rs.getString("ProductID")));
				prod.setName(rs.getString("Name"));
				prod.setDescription(rs.getString("Description"));
				prod.setPrice(Double.parseDouble(rs.getString("Price")));
				prod.setQuantityAvailable(Integer.parseInt(rs
						.getString("QuantitiyAvailable")));
				prod.setCategoryName(rs.getString("category"));

				preparedStatement = conn
						.prepareStatement("SELECT * FROM productimages WHERE IsActive = 1 and Product_ID = "
								+ prod.getProductID());
				rsForImages = preparedStatement.executeQuery();

				while (rsForImages.next()) {
					ProductImage prodImage = new ProductImage();
					prodImage.setImageID(Integer.parseInt(rsForImages
							.getString("ImageID")));
					prodImage.setImageURL(rsForImages.getString("URL"));
					prod.AddProductImage(prodImage);
				}

				preparedStatement = conn
						.prepareStatement("SELECT x.CRID, y.FirstName, y.LastName, x.Comment, x.CreatedAt FROM customerreviews x join users y on x.User_ID = y.UserID join products z on x.Product_ID = z.ProductID WHERE x.IsActive = 1 and x.Product_ID = "
								+ prod.getProductID()
								+ " order by x.CreatedAt desc");
				rsForComments = preparedStatement.executeQuery();
				while (rsForComments.next()) {
					CustomerReview review = new CustomerReview();
					review.setCRID(Integer.parseInt(rsForComments
							.getString("CRID")));
					review.getUserDetails().setFirstName(
							rsForComments.getString("FirstName"));
					review.getUserDetails().setLastName(
							rsForComments.getString("LastName"));
					review.setComment(rsForComments.getString("Comment"));
					review.setCreatedAt(rsForComments.getString("CreatedAt"));
					prod.AddProductReview(review);
				}
			}
		} catch (Exception e) {
			System.out.println("Error in getCategories" + e);
		}
		return prod;
	}

}