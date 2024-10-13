package com.tapfoods.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tapfoods.dao.OrderHistroyDao;
import com.tapfoods.model.OrderHistory;

public class OrderHistoryDaoImpl implements OrderHistroyDao {

	String INSERT_QUERY = "INSERT into `orderhistroy` (`orderHistoryId`,`userId` `orderId`) values (?,?,?)";
	String UPDATE_QUERY = "UPDATE `orderhistory` SET `userId` = ? , `orderId` = ? WHERE `orderHistoryID` = ?";
	String SELECT_QUERY = "SELECT * from `orderhistroy` WHERE `orderHistroyId` = ?";
	String DELETE_QUERY = "DELETE from `orderHistory` WHERE `orderHistoryID = ?";
	String SELECTALL_QUERY = "SELECT * from `orderHistory`";

	Connection connection = null;

	public OrderHistoryDaoImpl() {

		String url = "jdbc:mysql://localhost:3306/tapfoods";
		String username = "root";
		String password = "root";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addOrderHistoryItem(OrderHistory orderHistory) {

		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(INSERT_QUERY);

			prepareStatement.setInt(1, orderHistory.getOrderHistoryId());
			prepareStatement.setInt(2, orderHistory.getUserId());
			prepareStatement.setInt(3, orderHistory.getOrderId());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOrderHistroyItem(OrderHistory orderHistory) {

		PreparedStatement prepareStatement = null;

		try {
			prepareStatement = connection.prepareStatement(UPDATE_QUERY);

			prepareStatement.setInt(1, orderHistory.getUserId());
			prepareStatement.setInt(2, orderHistory.getOrderId());

			prepareStatement.setInt(3, orderHistory.getOrderHistoryId());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderHistory getOrderHistroyItem(int orderHistoryId) {

		PreparedStatement prepareStatement = null;

		ResultSet res = null;
		OrderHistory orderHistory = null;
		try {
			prepareStatement = connection.prepareStatement(SELECT_QUERY);

			prepareStatement.setInt(1, orderHistoryId);
			res = prepareStatement.executeQuery();

			if (res.next()) {
				int userId = res.getInt("userId");
				int orderId = res.getInt("orderId");

				orderHistory = new OrderHistory(orderHistoryId, userId, orderId);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderHistory;
	}

	@Override
	public void deleteOrderHistroyItem(int orderHistoryId) {

		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(DELETE_QUERY);
			prepareStatement.setInt(1, orderHistoryId);
			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderHistory> getAll() {

		Statement statement = null;

		ResultSet res = null;

		ArrayList<OrderHistory> OrderHistoryList = new ArrayList<OrderHistory>();
		try {
			statement = connection.createStatement();
			res = statement.executeQuery(SELECTALL_QUERY);

			while (res.next()) {

				int orderHistoryId = res.getInt("orderHistoryId");
				int userId = res.getInt("userId");
				int orderId = res.getInt("orderId");

				OrderHistory orderHistory = new OrderHistory(orderHistoryId, userId, orderId);

				OrderHistoryList.add(orderHistory);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return OrderHistoryList;

	}

}
