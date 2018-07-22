package com.SMS.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SMS.biz.Product;
import com.SMS.dataAccessLayer.Connector;
import com.SMS.utility.SessionAttributes;

/**
 * Servlet implementation class GetProductDetails
 */
@WebServlet("/GetProductDetails")
public class GetProductDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetProductDetails() {
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
		int prodId = Integer.parseInt(request.getParameter("ProductId"));
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession(false);

		if (null != session
				.getAttribute(SessionAttributes.FirstName.toString())) {
			session.setAttribute(SessionAttributes.ProductId.toString(), prodId+"");
			
			//int prodIdx = Integer.parseInt(request.getAttribute(SessionAttributes.ProductId.toString()).toString());
			
			writer.println("AllSet!");
		}
		else {
			writer.println("SessionTimeOut!");
		}
	}
	
	

}
