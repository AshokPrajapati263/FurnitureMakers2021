package com.furnituremakers.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.furnituremakers.service.StateService;
import com.furnituremakers.pojo.State;
import com.furnituremakers.validator.StateValidator;

@WebServlet("/StateController")
public class StateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		State state = null;
		try {
		String btn = request.getParameter("button");
		if (btn.equals("CREATE")) {
			StateValidator stateValidator = new StateValidator();
			state = stateValidator.createFillData(request);
			StateService stateService = new StateService();
			if (stateService.createData(state))
				response.sendRedirect("AdminView/statelist.jsp?action=create&name=State");
			else
				response.sendRedirect("AdminView/createstate.jsp");
		} else if (btn.equals("EDIT")) {
			doPut(request, response);
		}
		} catch (Exception e) {
			
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		State state = null;
		try {
		StateValidator stateValidator = new StateValidator();
		state = stateValidator.updateFillData(req);
		StateService stateService = new StateService();
		if (stateService.updateData(state))
			resp.sendRedirect("AdminView/statelist.jsp?action=edit&name=State");
		else
			resp.sendRedirect("AdminView/editstate.jsp?id="+state.getId());
		} catch (Exception e) {
			
		}
	}

}
