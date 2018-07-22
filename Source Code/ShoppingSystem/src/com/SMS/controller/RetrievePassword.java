package com.SMS.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SMS.biz.User;
import com.SMS.biz.UserTypes;
import com.SMS.biz.UsersFactory;
import com.SMS.dataAccessLayer.Connector;

/**
 * Servlet implementation class RetrievePassword
 */
@WebServlet("/RetrievePassword")
public class RetrievePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetrievePassword() {
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
		String emailAddress = request.getParameter("txtEmailAddress");
		PrintWriter out = response.getWriter();
		Connector dbCon;
		try {
			dbCon = new Connector();
			if(dbCon.checkIfEmailExists(emailAddress)){
				UsersFactory usersFactory = new UsersFactory();
				User user = usersFactory.GetUser(UserTypes.Customer);
				user.forgetPassword(emailAddress);
			}
			else {
				out.println("NoEmailFound");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
