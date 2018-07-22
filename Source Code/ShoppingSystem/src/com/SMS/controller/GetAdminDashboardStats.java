package com.SMS.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SMS.biz.Product;
import com.SMS.dataAccessLayer.Connector;

/**
 * Servlet implementation class GetAdminDashboardStats
 */
@WebServlet("/GetAdminDashboardStats")
public class GetAdminDashboardStats extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAdminDashboardStats() {
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
	}

	public static int getNumberOfCustomerReviews(){
		Connector dbCon = null;
		try {
			dbCon = new Connector();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dbCon.getNumberOfCustomerReviews();
	}
	
	public static int getCustomersCount(){
		Connector dbCon = null;
		try {
			dbCon = new Connector();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dbCon.getCustomersCount();
	}
	
	public static int getNumberOfSubscriptions(){
		Connector dbCon = null;
		try {
			dbCon = new Connector();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dbCon.getNumberOfSubscriptions();
	}

	public static int getCustomerQueries(){
		Connector dbCon = null;
		try {
			dbCon = new Connector();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dbCon.getCustomerQueries();
	}
}
