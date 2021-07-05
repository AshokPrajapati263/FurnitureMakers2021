package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.pojo.SubscriptionTypeMaster;
import com.furnituremakers.service.SubscriptionTypeMasterService;
import com.furnituremakers.validator.SubscriptionTypeMasterValidator;

@WebServlet("/SubscriptionTypeMasterController")
public class SubscriptionTypeMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubscriptionTypeMaster subscriptionTypeMaster = null;
		try {
		String btn = request.getParameter("button");
		if (btn.equals("CREATE")) {
		SubscriptionTypeMasterValidator subscriptionTypeMasterValidator = new SubscriptionTypeMasterValidator();
		subscriptionTypeMaster = subscriptionTypeMasterValidator.createFillData(request);
		SubscriptionTypeMasterService subscriptionTypeMasterService = new SubscriptionTypeMasterService();
		if(subscriptionTypeMasterService.createData(subscriptionTypeMaster))
			response.sendRedirect("AdminView/subscriptiontypelist.jsp?action=create&name=Subscription_Type");
		else
			response.sendRedirect("AdminView/createsubscriptiontype.jsp");
		} else if (btn.equals("EDIT")) {
			doPut(request, response);
		}
		} catch (Exception e) {
			
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		SubscriptionTypeMaster subscriptionTypeMaster = null;
		try {
		SubscriptionTypeMasterValidator subscriptionTypeMasterValidator = new SubscriptionTypeMasterValidator();
		subscriptionTypeMaster = subscriptionTypeMasterValidator.updateFillData(req);
		SubscriptionTypeMasterService subscriptionTypeMasterService = new SubscriptionTypeMasterService();
		if(subscriptionTypeMasterService.updateData(subscriptionTypeMaster)) 
			resp.sendRedirect("AdminView/subscriptiontypelist.jsp?action=edit&name=Subscription_Type");
		else
			resp.sendRedirect("AdminView/editsubscriptiontype.jsp?id="+subscriptionTypeMaster.getId());
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}