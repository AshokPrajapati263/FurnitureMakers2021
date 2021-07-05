package com.furnituremakers.validator;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.MaterialsType;
import com.furnituremakers.util.Util;

public class MaterialsTypeValidator {
	public MaterialsType createFillData(HttpServletRequest httpServletRequest) throws Exception {
		MaterialsType materialsType = new MaterialsType();
		materialsType.setName(httpServletRequest.getParameter("name").toUpperCase());
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			materialsType.setActive(true);
		materialsType.setCreatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		materialsType=createValidateData(materialsType);
//		validate Part End
		return materialsType;
	}
	public MaterialsType updateFillData(HttpServletRequest httpServletRequest) throws Exception {
		MaterialsType materialsType = new MaterialsType();
		materialsType.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		materialsType.setName(httpServletRequest.getParameter("name").toUpperCase());
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			materialsType.setActive(true);
		materialsType.setUpdatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		materialsType=createValidateData(materialsType);
//		validate Part End
		return materialsType;
	}
	private MaterialsType createValidateData(MaterialsType materialsType)
	{
		List<String> errorMsg = new LinkedList<>();
		materialsType.setErrorMsg(errorMsg);
		return materialsType;
	}
}
