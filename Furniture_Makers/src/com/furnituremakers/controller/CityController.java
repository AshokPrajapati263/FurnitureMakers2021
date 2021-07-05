package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.pojo.City;
import com.furnituremakers.service.CityService;
import com.furnituremakers.validator.CityValidator;

@WebServlet("/CityController")
public class CityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		City city = null;
		try {
		String btn = request.getParameter("button");
		if (btn.equals("CREATE")) {
		CityValidator cityValidator = new CityValidator();
		city = cityValidator.createFillData(request);
		CityService cityService = new CityService();
		if(cityService.createData(city))
			response.sendRedirect("AdminView/citylist.jsp?action=create&name=City");
		else
			response.sendRedirect("AdminView/createcity.jsp");
		} else if (btn.equals("EDIT")) {
			doPut(request, response);
		}
		} catch (Exception e) {
			
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		City city = null;
		try {
		CityValidator cityValidator = new CityValidator();
		city = cityValidator.updateFillData(req);
		CityService cityService = new CityService();
		if(cityService.updateData(city))
			resp.sendRedirect("AdminView/citylist.jsp?action=edit&name=City");
		else
			resp.sendRedirect("AdminView/editcity.jsp?id="+city.getId());
		} catch (Exception e) {
			
		}
	}
}