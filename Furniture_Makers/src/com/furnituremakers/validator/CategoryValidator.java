package com.furnituremakers.validator;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.Category;
import com.furnituremakers.util.Util;

public class CategoryValidator {
	public Category createFillData(HttpServletRequest httpServletRequest) throws Exception {
		Category category = new Category();
		category.setName(httpServletRequest.getParameter("name").toUpperCase());
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			category.setActive(true);
		category.setCreatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		category=createValidateData(category);
//		validate Part End
		return category;
	}
	public Category updateFillData(HttpServletRequest httpServletRequest) throws Exception {
		Category category = new Category();
		category.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		category.setName(httpServletRequest.getParameter("name").toUpperCase());
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			category.setActive(true);
		category.setUpdatedDate(Util.yyyymmddhhmmssFormate());	
//		Validate Part Start
		category=createValidateData(category);
//		validate Part End
		return category;
	}
	private Category createValidateData(Category category)
	{
		List<String> errorMsg = new LinkedList<>();
		category.setErrorMsg(errorMsg);
		return category;
	}
}
