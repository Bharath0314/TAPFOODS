package com.tapfoods.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tapfoods.daoimpl.orderStatusDaoImpl;

@WebServlet("/trackcontroller")
public class orderStatusController extends HttpServlet {

	public void getOrderStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderId = request.getParameter("orderId");

		orderStatusDaoImpl orderStatusDaoImpl = new orderStatusDaoImpl();
		String status = orderStatusDaoImpl.fetchOrderStatus(orderId);

		request.setAttribute("status", status);

		RequestDispatcher rd = request.getRequestDispatcher("trackOrderStatus.jsp");
		rd.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		orderStatusController orderStatusController = new orderStatusController();
		orderStatusController.getOrderStatus(request, response);
	}

}
