package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.pojo.SubCategory;
import com.furnituremakers.service.SubCategoryService;
import com.furnituremakers.validator.SubCategoryValidator;

@WebServlet("/SubCategoryController")
public class SubCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubCategory subCategory = null;
		try {
		String btn = request.getParameter("button");
		if (btn.equals("CREATE")) {
		SubCategoryValidator subCategoryValidator = new SubCategoryValidator();
		subCategory = subCategoryValidator.createFillData(request);
		SubCategoryService subCategoryService = new SubCategoryService();
		if(subCategoryService.createData(subCategory))
			response.sendRedirect("AdminView/subcategorylist.jsp?action=create&name=SubCategory");
		else
			response.sendRedirect("AdminView/createsubcategory.jsp");
		} else if (btn.equals("EDIT")) {
			doPut(request, response);
		}
		} catch (Exception e) {
			
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		SubCategory subCategory = null;
		try {
		SubCategoryValidator subCategoryValidator = new SubCategoryValidator();
		subCategory = subCategoryValidator.updateFillData(req);
		SubCategoryService subCategoryService = new SubCategoryService();
		if(subCategoryService.updateData(subCategory))
			resp.sendRedirect("AdminView/subcategorylist.jsp?action=edit&name=SubCategory");
		else
			resp.sendRedirect("AdminView/editsubcategory.jsp?id="+subCategory.getId());
		} catch (Exception e) {
			
		}
	}
}