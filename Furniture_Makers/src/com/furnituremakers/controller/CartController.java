package com.furnituremakers.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.pojo.Cart;
import com.furnituremakers.service.CartService;
import com.furnituremakers.validator.CartValidator;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CartValidator cartValidator = new CartValidator();
			Cart cart = cartValidator.createFillData(request);
			CartService cartService = new CartService();
			cartService.createData(cart);
			PrintWriter printWriter = response.getWriter();
			printWriter.print(cartService.getCartCount(cart.getUserId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}
