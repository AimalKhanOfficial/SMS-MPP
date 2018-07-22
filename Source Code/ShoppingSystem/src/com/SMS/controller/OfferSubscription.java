package com.SMS.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

import com.SMS.biz.UserTypes;
import com.SMS.biz.UsersFactory;
import com.SMS.dataAccessLayer.Connector;

/**
 * Servlet implementation class OfferSubscription
 */
@WebServlet("/OfferSubscription")
public class OfferSubscription extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OfferSubscription() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = Integer
				.parseInt(request.getParameter("userId").toString());
		String fullName = request.getParameter("fullName").toString();

		UsersFactory usersFactory = new UsersFactory();
		com.SMS.biz.User user = usersFactory.GetUser(UserTypes.Customer);
		
		PrintWriter out = response.getWriter();

		if (user.subscribeOffersNotifications(userId, fullName)) {
			out.println("success");
		} else {
			out.println("Issue");
		}
	}

	public static boolean checkIfSubscribedToNotifications(int userId) {
		Connector dbCon = null;
		try {
			dbCon = new Connector();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dbCon.checkIfSubscribedToOffersNotifications(userId);
	}

}
