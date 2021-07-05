package com.furnituremakers.controller;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.furnituremakers.service.ReportService;

/**
 * Servlet implementation class ReportController
 */
@WebServlet("/ReportController")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String report = request.getParameter("report");
		ReportService reportService = new ReportService();
		if(report.equals("country"))
		{
			try {
				reportService.countyReport(response);
				response.sendRedirect("AdminView/countrylist.jsp?action=download&name=File");
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println(e);
			}
		}
	}

}
