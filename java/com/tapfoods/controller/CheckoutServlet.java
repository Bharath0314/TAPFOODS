package com.tapfoods.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.daoimpl.OrderDaoImpl;
import com.tapfoods.model.Cart;
import com.tapfoods.model.CartItem;
import com.tapfoods.model.Order;
import com.tapfoods.model.User;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

	private OrderDaoImpl orderDaoImpl;

	public void init() {
		orderDaoImpl = new OrderDaoImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");

		if (cart != null) {

			double totalPrice = 0;
			for (CartItem item : cart.getItems().values()) {
				totalPrice += item.getPrice() * item.getQuantity();
			}

			session.setAttribute("totalPrice", totalPrice);
		} else {
			String paymentMethod = req.getParameter("payment");

			Order order = new Order();

			order.setRestaurantId((int) session.getAttribute("restaurantId"));
			order.setUserId(user.getUserId());
			order.setModeOfPayment(paymentMethod);
			order.setStatus("pending");

			orderDaoImpl.addOrder(order);

			session.removeAttribute("cart");
			session.setAttribute("order", order);

		}
		resp.sendRedirect("Confirmation.jsp");
	}

}