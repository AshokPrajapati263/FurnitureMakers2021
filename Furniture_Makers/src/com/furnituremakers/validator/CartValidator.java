package com.furnituremakers.validator;

import javax.servlet.http.HttpServletRequest;

import com.furnituremakers.pojo.Cart;

public class CartValidator {
	public Cart createFillData(HttpServletRequest httpServletRequest) throws Exception{
		Cart cart = new Cart();
		cart.setProductId(Integer.valueOf(httpServletRequest.getParameter("product_id")));
		cart.setQuantity(Integer.valueOf(httpServletRequest.getParameter("quantity")));
		cart.setUserId(Integer.valueOf(httpServletRequest.getParameter("useridcart")));
		return cart;
	}
}
