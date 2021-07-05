package com.furnituremakers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.service.CountryService;
import com.furnituremakers.pojo.Country;
import com.furnituremakers.validator.CountryValidator;

@WebServlet("/CountryController")
public class CountryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Country country = null;
		try {
			String btn = request.getParameter("button");
			if (btn.equals("CREATE")) {
				CountryValidator countryValidator = new CountryValidator();
				country = countryValidator.createFillData(request);
				if(country.getErrorMsg().isEmpty())
				{
					CountryService countryService = new CountryService();
					if (countryService.createData(country))
						response.sendRedirect("AdminView/countrylist.jsp?action=create&name=Country");
				}
				else
				{
					request.setAttribute("CountyPojo",country);
					RequestDispatcher rd = request.getRequestDispatcher("AdminView/createcountry.jsp");
					rd.forward(request, response);
				}
			} else if (btn.equals("EDIT")) {
				doPut(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("CountyPojo",country);
			RequestDispatcher rd = request.getRequestDispatcher("AdminView/createcountry.jsp");
			rd.forward(request, response);
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Country country = null;
		try {
			CountryValidator countryValidator = new CountryValidator();
			country = countryValidator.updateFillData(req);
			if(country.getErrorMsg().isEmpty())
			{
				CountryService countryService = new CountryService();
				boolean result = countryService.updateData(country);
				if (result)
					resp.sendRedirect("AdminView/countrylist.jsp?action=edit&name=Country");
			}
			else
			{
				req.setAttribute("CountyPojo",country);
				RequestDispatcher rd = req.getRequestDispatcher("AdminView/editcountry.jsp");
				rd.forward(req, resp);
			}
		} catch (Exception e) {
			req.setAttribute("CountyPojo",country);
			RequestDispatcher rd = req.getRequestDispatcher("AdminView/editcountry.jsp");
			rd.forward(req, resp);
		}	
	}
}
