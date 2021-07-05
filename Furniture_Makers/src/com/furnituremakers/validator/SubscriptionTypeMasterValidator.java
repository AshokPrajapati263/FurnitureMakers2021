package com.furnituremakers.validator;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.SubscriptionTypeMaster;
import com.furnituremakers.util.Util;

public class SubscriptionTypeMasterValidator {
	public SubscriptionTypeMaster createFillData(HttpServletRequest httpServletRequest) throws Exception {
		SubscriptionTypeMaster subscriptionTypeMaster =new SubscriptionTypeMaster();
		subscriptionTypeMaster.setName(httpServletRequest.getParameter("name").toUpperCase());
		subscriptionTypeMaster.setValidityType(Integer.valueOf(httpServletRequest.getParameter("validitytype")));
		subscriptionTypeMaster.setOnlineDate(httpServletRequest.getParameter("onlinedate"));
		subscriptionTypeMaster.setEndDate(httpServletRequest.getParameter("enddate"));
		subscriptionTypeMaster.setPrice(Double.valueOf(httpServletRequest.getParameter("price")));
		subscriptionTypeMaster.setCreatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		subscriptionTypeMaster=createValidateData(subscriptionTypeMaster);
//		validate Part End
		return subscriptionTypeMaster;
	}
	public SubscriptionTypeMaster updateFillData(HttpServletRequest httpServletRequest) throws Exception {
		SubscriptionTypeMaster subscriptionTypeMaster = new SubscriptionTypeMaster();
		subscriptionTypeMaster.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		subscriptionTypeMaster.setFlag(Boolean.valueOf(httpServletRequest.getParameter("flag")));
		subscriptionTypeMaster.setName(httpServletRequest.getParameter("name").toUpperCase());
		subscriptionTypeMaster.setValidityType(Integer.valueOf(httpServletRequest.getParameter("validitytype")));
		subscriptionTypeMaster.setOnlineDate(httpServletRequest.getParameter("onlinedate"));
		subscriptionTypeMaster.setEndDate(httpServletRequest.getParameter("enddate"));
		subscriptionTypeMaster.setPrice(Double.valueOf(httpServletRequest.getParameter("price")));
		subscriptionTypeMaster.setCreatedDate(Util.yyyymmddhhmmssFormate());
		subscriptionTypeMaster.setUpdatedDate(Util.yyyymmddhhmmssFormate());	
//		Validate Part Start
		subscriptionTypeMaster=createValidateData(subscriptionTypeMaster);
//		validate Part End
		return subscriptionTypeMaster;
	}
	private SubscriptionTypeMaster createValidateData(SubscriptionTypeMaster subscriptionTypeMaster)
	{
		List<String> errorMsg = new LinkedList<>();
		subscriptionTypeMaster.setErrorMsg(errorMsg);
		return subscriptionTypeMaster;
	}
}
