package com.tapfoods.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.daoimpl.RestaurantDaoImpl;
import com.tapfoods.model.Restaurant;

@WebServlet("/Home")
public class FirstPageServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RestaurantDaoImpl rDao = new RestaurantDaoImpl();
		List<Restaurant> RL = rDao.getAll();

		HttpSession session = req.getSession();
		session.setAttribute("restroList", RL);

		RequestDispatcher rdp = req.getRequestDispatcher("Restaurant.jsp");
		rdp.forward(req, resp);
	}

}
