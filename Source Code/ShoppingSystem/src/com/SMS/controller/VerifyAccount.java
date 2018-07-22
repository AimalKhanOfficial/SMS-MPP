package com.SMS.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SMS.dataAccessLayer.Connector;
import com.SMS.utility.SessionAttributes;

/**
 * Servlet implementation class VerifyAccount
 */
@WebServlet("/VerifyAccount")
public class VerifyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VerifyAccount() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String submittedVerificationCode = request.getParameter("txtVerificationCode");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		
		if(null != session.getAttribute(SessionAttributes.FirstName.toString())){
			String verifcationCode = (String) request.getSession(false).getAttribute(SessionAttributes.VerificationCode.toString());
			long userId = Long.parseLong(request.getSession(false).getAttribute(SessionAttributes.UserID.toString()).toString());
			
			
			if(verifcationCode.equals(submittedVerificationCode)){
				Connector dbCon;
				try {
					dbCon = new Connector();
					String fullName = (String) request.getSession(false).getAttribute(SessionAttributes.FirstName.toString()) + " " + 
							request.getSession(false).getAttribute(SessionAttributes.LastName.toString());
					int results = dbCon.acticateUserAcc(Integer.parseInt(userId+""),fullName);
					if(results > 0){
						out.println("AccActivated!");	
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			else {
				out.println("Nop!");
			}
		}
		else {
			out.println("sessionTimeOut");
		}
	}
}
