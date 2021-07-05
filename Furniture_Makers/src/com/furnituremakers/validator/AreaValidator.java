package com.furnituremakers.validator;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.Area;
import com.furnituremakers.util.Util;

public class AreaValidator {
	public Area createFillData(HttpServletRequest httpServletRequest) throws Exception {
		Area area =new Area();
		area.setName(httpServletRequest.getParameter("name").toUpperCase());
		area.setPincode(Integer.valueOf(httpServletRequest.getParameter("pincode")));
		area.setCityId(Integer.valueOf(httpServletRequest.getParameter("cityid")));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			area.setActive(true);
		area.setCreatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		area=createValidateData(area);
//		validate Part End
		return area;
	}
	public Area updateFillData(HttpServletRequest httpServletRequest) throws Exception {
		Area area = new Area();
		area.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		area.setName(httpServletRequest.getParameter("name").toUpperCase());
		area.setPincode(Integer.valueOf(httpServletRequest.getParameter("pincode")));
		area.setCityId(Integer.valueOf(httpServletRequest.getParameter("cityid")));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			area.setActive(true);
		area.setUpdatedDate(Util.yyyymmddhhmmssFormate());	
//		Validate Part Start
		area=createValidateData(area);
//		validate Part End
		return area;
	}
	private Area createValidateData(Area area)
	{
		List<String> errorMsg = new LinkedList<>();
		area.setErrorMsg(errorMsg);
		return area;
	}
}
