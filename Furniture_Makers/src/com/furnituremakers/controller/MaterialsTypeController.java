package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.pojo.MaterialsType;
import com.furnituremakers.service.MaterialsTypeService;
import com.furnituremakers.validator.MaterialsTypeValidator;

@WebServlet("/MaterialsTypeController")
public class MaterialsTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MaterialsType materialsType = null;
		try {
		String btn = request.getParameter("button");
		if (btn.equals("CREATE")) {
		MaterialsTypeValidator materialsTypeValidator = new MaterialsTypeValidator();
		materialsType = materialsTypeValidator.createFillData(request);
		MaterialsTypeService materialsTypeService = new MaterialsTypeService();
		if(materialsTypeService.createData(materialsType))
			response.sendRedirect("AdminView/materialstypelist.jsp?action=create&name=Material_Type");
		else
			response.sendRedirect("AdminView/creatematerialstype.jsp");
		} else if (btn.equals("EDIT")) {
			doPut(request, response);
		}
		} catch (Exception e) {
			
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MaterialsType materialsType = null;
		try {
		MaterialsTypeValidator materialsTypeValidator = new MaterialsTypeValidator();
		materialsType = materialsTypeValidator.updateFillData(req);
		MaterialsTypeService materialsTypeService = new MaterialsTypeService();
		if(materialsTypeService.updateData(materialsType))
			resp.sendRedirect("AdminView/materialstypelist.jsp?action=edit&name=Material_Type");
		else
			resp.sendRedirect("AdminView/editmaterialstype.jsp?id="+materialsType.getId());
		} catch (Exception e) {
			
		}
	}
}