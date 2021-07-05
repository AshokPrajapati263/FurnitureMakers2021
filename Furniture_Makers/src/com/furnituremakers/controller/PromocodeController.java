package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.pojo.Promocode;
import com.furnituremakers.service.PromocodeService;
import com.furnituremakers.validator.PromocodeValidator;

@WebServlet("/PromocodeController")
public class PromocodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Promocode promocode = null;
		try {
		String btn = request.getParameter("button");
		if (btn.equals("CREATE")) {
		PromocodeValidator promocodeValidator = new PromocodeValidator();
		promocode = promocodeValidator.createFillData(request);
		PromocodeService promocodeService = new PromocodeService();
		if(promocodeService.createData(promocode))
			response.sendRedirect("AdminView/promocodelist.jsp?action=create&name=PromoCode");
		else
			response.sendRedirect("AdminView/createpromocode.jsp");
		} else if (btn.equals("EDIT")) {
			doPut(request, response);
		}
		} catch (Exception e) {
			
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Promocode promocode = null;
		try {
		PromocodeValidator promocodeValidator = new PromocodeValidator();
		promocode = promocodeValidator.updateFillData(req);
		PromocodeService promocodeService = new PromocodeService();
		if(promocodeService.updateData(promocode))
			resp.sendRedirect("AdminView/promocodelist.jsp?action=edit&name=PromoCode");
		else
			resp.sendRedirect("AdminView/editpromocode.jsp?id="+promocode.getId());
		} catch (Exception e) {
			
		}
	}
}