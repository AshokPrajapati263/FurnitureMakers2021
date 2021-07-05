package com.furnituremakers.validator;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.City;
import com.furnituremakers.util.Util;

public class CityValidator {
	public City createFillData(HttpServletRequest httpServletRequest) throws Exception {
		City city =new City();
		city.setName(httpServletRequest.getParameter("name").toUpperCase());
		city.setStateId(Integer.valueOf(httpServletRequest.getParameter("stateid")));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			city.setActive(true);
		city.setCreatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		city=createValidateData(city);
//		validate Part End
		return city;
	}
	public City updateFillData(HttpServletRequest httpServletRequest) throws Exception {
		City city = new City();
		city.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		city.setName(httpServletRequest.getParameter("name").toUpperCase());
		city.setStateId(Integer.valueOf(httpServletRequest.getParameter("stateid")));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			city.setActive(true);
		city.setUpdatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		city=createValidateData(city);
//		validate Part End
		return city;
	}
	private City createValidateData(City city)
	{
		List<String> errorMsg = new LinkedList<>();
		city.setErrorMsg(errorMsg);
		return city;
	}
}
