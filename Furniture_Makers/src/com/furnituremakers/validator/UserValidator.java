package com.furnituremakers.validator;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.User;

public class UserValidator {
	public User createFillData(HttpServletRequest httpServletRequest) throws Exception {
		User user =new User();
		user.setFirstName(httpServletRequest.getParameter("firstname"));
		user.setLastName(httpServletRequest.getParameter("lastname"));
		user.setPhoneNo(httpServletRequest.getParameter("phonenumber"));
		user.setDob(httpServletRequest.getParameter("dob"));
		user.setGender(httpServletRequest.getParameter("gender"));
		user.setAddressLine1(httpServletRequest.getParameter("adl1"));
		user.setAddtessLine2(httpServletRequest.getParameter("adl2"));
		user.setAreaId(Integer.valueOf(httpServletRequest.getParameter("area")));
		user.setEmail(httpServletRequest.getParameter("email"));
		user.setPassword(httpServletRequest.getParameter("password"));
		user.setUserTypeMasterId(Integer.valueOf(httpServletRequest.getParameter("user")));
		System.out.println(httpServletRequest.getParameter("user"));
		return user;
	}
	public User login(HttpServletRequest httpServletRequest) throws Exception {
		User user =new User();
		user.setEmail(httpServletRequest.getParameter("email"));
		user.setPassword(httpServletRequest.getParameter("password"));
		return user;
	}
}
