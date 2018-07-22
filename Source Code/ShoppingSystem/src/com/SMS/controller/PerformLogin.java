package com.SMS.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.SMS.biz.Customer;
import com.SMS.biz.User;
import com.SMS.biz.UserTypes;
import com.SMS.biz.UsersFactory;
import com.SMS.utility.SessionAttributes;
import com.SMS.utility.Utility;

/**
 * Servlet implementation class PerformLogin
 */
@WebServlet("/PerformLogin")
public class PerformLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerformLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String emailAddress = request.getParameter("email");
		String password = request.getParameter("password");
		UsersFactory usersFactory = new UsersFactory();
		User customer = usersFactory.GetUser(UserTypes.Customer);
		Customer customerAfterLogin = customer.Login(emailAddress, password);
		PrintWriter writer = response.getWriter();
		if(customerAfterLogin!=null){
						
			HttpSession session = request.getSession(true);
			session.setAttribute(SessionAttributes.UserID.toString(), customerAfterLogin.getUserId());
			session.setAttribute(SessionAttributes.FirstName.toString(), customerAfterLogin.getFirstName());
			session.setAttribute(SessionAttributes.LastName.toString(), customerAfterLogin.getLastName());
			session.setAttribute(SessionAttributes.UserType_ID.toString(), customerAfterLogin.getUserTypeId());
			session.setAttribute(SessionAttributes.EmailAddress.toString(), customerAfterLogin.getEmail());
			session.setAttribute(SessionAttributes.Password.toString(), customerAfterLogin.getPassword());
			session.setAttribute(SessionAttributes.ShippingAddress.toString(), customerAfterLogin.getShippingAddress());
			session.setAttribute(SessionAttributes.ContactNumber.toString(), customerAfterLogin.getContactNumber());
			session.setAttribute(SessionAttributes.IsAccVerified.toString(), customerAfterLogin.getIsAccVerified());
			session.setAttribute(SessionAttributes.VerificationCode.toString(), customerAfterLogin.getVerificationCode());
			session.setAttribute(SessionAttributes.CategoryId.toString(), 0);
			if(!customerAfterLogin.getIsAccVerified()){
				writer.println("verifyUser!");
			}
			else {
				//writer.println("toMainPage");
				
				if(customerAfterLogin.getUserTypeId().equals("1")){
					writer.println("AdminDashboard.jsp");
				}
				else if(customerAfterLogin.getUserTypeId().equals("2")){
					writer.println("CustomerDashboard.jsp");
				}
				
			}
			
		}
		else {
			writer.println("NoUserRecordFound!");
		}
		
	}

}
