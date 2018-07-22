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

/**
 * Servlet implementation class NotifyUsersForOffer
 */
@WebServlet("/NotifyUsersForOffer")
public class NotifyUsersForOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotifyUsersForOffer() {
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
		String emailText = request.getParameter("emailtext");
		
		UsersFactory usersFactory = new UsersFactory();
		User user = usersFactory.GetUser(UserTypes.Admin);
		PrintWriter out = response.getWriter();
		
		if(user.notifyUsersForSale(emailText)){
			out.println("success");
		}
		else {
			out.println("error");
		}
		
	}

}
