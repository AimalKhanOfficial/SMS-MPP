package com.SMS.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SMS.utility.SessionAttributes;

/**
 * Servlet implementation class SetCategoryForProducts
 */
@WebServlet("/SetCategoryForProducts")
public class SetCategoryForProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetCategoryForProducts() {
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
		int categoryId = Integer.parseInt(request.getParameter("categoryId").toString());
		HttpSession session = request.getSession(false);
		PrintWriter writer = response.getWriter();
		
		if (null != session
				.getAttribute(SessionAttributes.FirstName.toString())) {
			
			session.setAttribute(SessionAttributes.CategoryId.toString(), categoryId);
			writer.println("AllSet!");
		}
		else {
			writer.println("SessionTimeOut!");
		}
		
		
	}

}
