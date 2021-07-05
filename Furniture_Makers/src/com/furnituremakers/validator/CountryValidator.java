package com.furnituremakers.validator;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.Country;
import com.furnituremakers.util.Util;

public class CountryValidator {
	public Country createFillData(HttpServletRequest httpServletRequest) throws Exception {
		Country country = new Country();
		country.setName(httpServletRequest.getParameter("name").toUpperCase());
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			country.setActive(true);
		country.setCreatedDate(Util.yyyymmddhhmmssFormate());
		
//		Validate Part Start
		country=createValidateData(country);
//		validate Part End
		
		return country;
	}
	public Country updateFillData(HttpServletRequest httpServletRequest) throws Exception{
		Country country = new Country();
		country.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		country.setName(httpServletRequest.getParameter("name").toUpperCase());
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			country.setActive(true);
		country.setUpdatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		country=createValidateData(country);
//		validate Part End

		return country;
	}
	
	private Country createValidateData(Country country)
	{
		List<String> errorMsg = new LinkedList<>();
		if(country.getName().trim()==null || country.getName().trim().isBlank() || country.getName().trim().isEmpty())
		{
			errorMsg.add("Country Name is Required.");
		}
		country.setErrorMsg(errorMsg);
		return country;	
	}
}
