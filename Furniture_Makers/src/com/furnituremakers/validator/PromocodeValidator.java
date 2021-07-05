package com.furnituremakers.validator;


import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.Promocode;

public class PromocodeValidator {
	public Promocode createFillData(HttpServletRequest httpServletRequest) throws Exception {
		Promocode promocode = new Promocode();
		promocode.setCode(httpServletRequest.getParameter("promocode"));
		promocode.setStartDate(httpServletRequest.getParameter("startdate"));
		promocode.setEndDate(httpServletRequest.getParameter("enddate"));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			promocode.setActive(true);
		promocode.setAmount(Double.valueOf(httpServletRequest.getParameter("amount")));
		String isPercentage = httpServletRequest.getParameter("ispercentage");
		if(isPercentage!=null&&isPercentage.equals("on"))
			promocode.setPercentage(true);
		String maxDiscount = httpServletRequest.getParameter("maxdiscount");
		if(maxDiscount!=null&&maxDiscount!="")
			promocode.setMaxDiscount(Double.valueOf(httpServletRequest.getParameter("maxdiscount")));
		promocode.setApplicableCount(Integer.valueOf(httpServletRequest.getParameter("applicablecount")));
		promocode.setUserId(Integer.valueOf("5"));
//		Validate Part Start
		promocode=createValidateData(promocode);
//		validate Part End
		return promocode;
	}
	public Promocode updateFillData(HttpServletRequest httpServletRequest) throws Exception {
		Promocode promocode = new Promocode();
		promocode.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		promocode.setCode(httpServletRequest.getParameter("promocode"));
		promocode.setStartDate(httpServletRequest.getParameter("startdate"));
		promocode.setEndDate(httpServletRequest.getParameter("enddate"));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			promocode.setActive(true);
		promocode.setAmount(Double.valueOf(httpServletRequest.getParameter("amount")));
		String isPercentage = httpServletRequest.getParameter("ispercentage");
		if(isPercentage!=null&&isPercentage.equals("on"))
			promocode.setPercentage(true);
		String maxDiscount = httpServletRequest.getParameter("maxdiscount");
		if(maxDiscount!=null&&maxDiscount!="")
			promocode.setMaxDiscount(Double.valueOf(httpServletRequest.getParameter("maxdiscount")));
		else
			promocode.setMaxDiscount(0);
		promocode.setApplicableCount(Integer.valueOf(httpServletRequest.getParameter("applicablecount")));
		promocode.setUserId(Integer.valueOf("5"));	
//		Validate Part Start
		promocode=createValidateData(promocode);
//		validate Part End
		return promocode;
	}
	private Promocode createValidateData(Promocode promocode)
	{
		List<String> errorMsg = new LinkedList<>();
		promocode.setErrorMsg(errorMsg);
		return promocode;
	}
}
