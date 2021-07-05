package com.furnituremakers.validator;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.SubCategory;
import com.furnituremakers.util.Util;

public class SubCategoryValidator {
	public SubCategory createFillData(HttpServletRequest httpServletRequest) throws Exception {
		SubCategory subCategory = new SubCategory();
		subCategory.setName(httpServletRequest.getParameter("name").toUpperCase());
		subCategory.setCategoryId(Integer.valueOf(httpServletRequest.getParameter("categoryid")));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			subCategory.setActive(true);
		subCategory.setCreatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		subCategory=createValidateData(subCategory);
//		validate Part End
		return subCategory;
	}
	public SubCategory updateFillData(HttpServletRequest httpServletRequest) throws Exception {
		SubCategory subCategory = new SubCategory();
		subCategory.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		subCategory.setName(httpServletRequest.getParameter("name").toUpperCase());
		subCategory.setCategoryId(Integer.valueOf(httpServletRequest.getParameter("categoryid")));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			subCategory.setActive(true);
		subCategory.setUpdatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		subCategory=createValidateData(subCategory);
//		validate Part End
		return subCategory;
	}
	private SubCategory createValidateData(SubCategory subCategory)
	{
		List<String> errorMsg = new LinkedList<>();
		subCategory.setErrorMsg(errorMsg);
		return subCategory;
	}
}
