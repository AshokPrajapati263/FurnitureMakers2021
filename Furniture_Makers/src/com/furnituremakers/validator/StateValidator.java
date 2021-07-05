package com.furnituremakers.validator;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.State;
import com.furnituremakers.util.Util;

public class StateValidator {
	public State createFillData(HttpServletRequest httpServletRequest) throws Exception {
		State state = new State();
		state.setName(httpServletRequest.getParameter("name").toUpperCase());
		state.setCountryId(Integer.valueOf(httpServletRequest.getParameter("countryid")));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			state.setActive(true);
		state.setCreatedDate(Util.yyyymmddhhmmssFormate());
//		Validate Part Start
		state=createValidateData(state);
//		validate Part End
		return state;
	}
	public State updateFillData(HttpServletRequest httpServletRequest) throws Exception {
		State state = new State();
		state.setId(Integer.valueOf(httpServletRequest.getParameter("id")));
		state.setName(httpServletRequest.getParameter("name").toUpperCase());
		state.setCountryId(Integer.valueOf(httpServletRequest.getParameter("countryid")));
		String isActive = httpServletRequest.getParameter("isactive");
		if(isActive!=null&&isActive.equals("on"))
			state.setActive(true);
		state.setUpdatedDate(Util.yyyymmddhhmmssFormate());	
//		Validate Part Start
		state=createValidateData(state);
//		validate Part End
		return state;
	}
	private State createValidateData(State state)
	{
		List<String> errorMsg = new LinkedList<>();
		state.setErrorMsg(errorMsg);
		return state;
	}
}
