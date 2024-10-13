package com.tapfoods.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.daoimpl.UserDaoImpl;
import com.tapfoods.model.PasswordEncryption;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private UserDaoImpl userDaoImpl;

	public void init() throws ServletException {
		userDaoImpl = new UserDaoImpl();

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("username");
		String password = req.getParameter("password");

		String encryptedPassword = PasswordEncryption.encryption(password);

		boolean isValid = userDaoImpl.isValidUser(userName, encryptedPassword);

		HttpSession session = req.getSession();

		Integer attempts = (Integer) session.getAttribute("attempts");
		if (attempts == null) {
			attempts = 0;
		}

		if (isValid) {
			session.setAttribute("userName", userName);
			resp.sendRedirect("RestaurantMain.jsp");

		} else {
			attempts++;
			session.setAttribute("attempts", attempts);
			if (attempts >= 3) {
				resp.sendRedirect("Login.jsp?error=max_attempts");
			} else {
				resp.sendRedirect("Login.jsp?error=invalid_credientials");
			}
		}

	}

}
