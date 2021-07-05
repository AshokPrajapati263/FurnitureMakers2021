package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.furnituremakers.pojo.User;
import com.furnituremakers.service.CartService;
import com.furnituremakers.service.UserService;
import com.furnituremakers.validator.UserValidator;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserValidator userValidator = new UserValidator();
			User user = userValidator.login(request);
			UserService userService = new UserService();
			User user2 = userService.login(user);
			if(user2 != null) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("user", user2);
				CartService cartService = new CartService();
				httpSession.setAttribute("cartservice", cartService);
				if(user2.getUserTypeMasterId()==2) {
					response.sendRedirect("CustomerView/index.jsp?action=login&name=:)");
				}
				else if(user2.getUserTypeMasterId()==1) {
					response.sendRedirect("AdminView/index.jsp?action=login&name=:)");
				}
				else if(user2.getUserTypeMasterId()==3) {
					response.sendRedirect("VendorView/index.jsp?action=login&name=:)");
				}
			}
			else
			{
				response.sendRedirect("Login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
