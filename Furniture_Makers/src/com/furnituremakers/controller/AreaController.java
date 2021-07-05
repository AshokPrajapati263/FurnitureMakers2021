package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.pojo.Area;
import com.furnituremakers.service.AreaService;
import com.furnituremakers.validator.AreaValidator;

@WebServlet("/AreaController")
public class AreaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Area area = null;
		try {
		String btn = request.getParameter("button");
		if (btn.equals("CREATE")) {
		AreaValidator areaValidator = new AreaValidator();
		area = areaValidator.createFillData(request);
		AreaService areaService = new AreaService();
		if(areaService.createData(area))
			response.sendRedirect("AdminView/arealist.jsp?action=create&name=Area");
		else
			response.sendRedirect("AdminView/createarea.jsp");
		} else if (btn.equals("EDIT")) {
			doPut(request, response);
		}
		} catch (Exception e) {
			
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Area area = null;
		try {
		AreaValidator areaValidator = new AreaValidator();
		area = areaValidator.updateFillData(req);
		AreaService areaService = new AreaService();
		if(areaService.updateData(area))
			resp.sendRedirect("AdminView/arealist.jsp?action=edit&name=Area");
		else
			resp.sendRedirect("AdminView/editarea.jsp?id="+area.getId());
		} catch (Exception e) {
			
		}
	}
}