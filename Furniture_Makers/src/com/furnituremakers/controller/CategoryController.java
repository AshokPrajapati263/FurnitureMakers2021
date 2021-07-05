package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.pojo.Category;
import com.furnituremakers.service.CategoryService;
import com.furnituremakers.validator.CategoryValidator;

@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Category category = null;
		try {
		String btn = request.getParameter("button");
		if (btn.equals("CREATE")) {
		CategoryValidator categoryValidator = new CategoryValidator();
		category = categoryValidator.createFillData(request);
		CategoryService categoryService = new CategoryService();
		if(categoryService.createData(category))
			response.sendRedirect("AdminView/categorylist.jsp?action=create&name=Category");
		else
			response.sendRedirect("AdminView/createcategory.jsp");
		} else if (btn.equals("EDIT")) {
			doPut(request, response);
		}
		} catch (Exception e) {
			
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Category category = null;
		try {
		CategoryValidator categoryValidator = new CategoryValidator();
		category = categoryValidator.updateFillData(req);
		CategoryService categoryService = new CategoryService();
		if(categoryService.updateData(category))
			resp.sendRedirect("AdminView/categorylist.jsp?action=edit&name=Category");
		else
			resp.sendRedirect("AdminView/editcategory.jsp?id="+category.getId());
		} catch (Exception e) {
			
		}
	}
}