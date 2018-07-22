package com.SMS.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SMS.biz.User;
import com.SMS.biz.UserTypes;
import com.SMS.biz.UsersFactory;
import com.SMS.dataAccessLayer.Connector;
import com.SMS.utility.SessionAttributes;

/**
 * Servlet implementation class CreateProductReview
 */
@WebServlet("/CreateProductReview")
public class CreateProductReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateProductReview() {
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
		String reviewText = request.getParameter("reviewText");
		int prodId = Integer.parseInt(request.getParameter("prodId").toString());
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);

		if (null != session
				.getAttribute(SessionAttributes.FirstName.toString())) {

			UsersFactory usersFactory = new UsersFactory();
			User user = usersFactory.GetUser(UserTypes.Customer);
			if (user.ReviewProduct(
					Integer.parseInt(session.getAttribute(
							SessionAttributes.UserID.toString()).toString()),
					prodId,
					reviewText,
					session.getAttribute(SessionAttributes.FirstName.toString())
							+ ""
							+ session.getAttribute(SessionAttributes.LastName
									.toString()))) {
				out.println("success!");
			}
		} else {
			out.println("sessionTimeOut!");
		}
	}

}
