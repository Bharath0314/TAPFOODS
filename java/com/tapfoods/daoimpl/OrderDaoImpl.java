package com.tapfoods.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tapfoods.dao.OrderDao;
import com.tapfoods.model.Order;

public class OrderDaoImpl implements OrderDao {

	static final String INSERT_QUERY = "INSERT into `order` (`orderid` , `restaurantid` , `userId`, `totalAmount`,`modeOfPayment`, `status`) values (?,?,?,?,?,?)";
	static final String DELETE_QUERY = "DELETE from `order` WHERE `orderId = ?";
	static final String SELECT_QUERY = "SELECT * from `order` WHERE `orderId` = ?";
	static final String UPDATE_QUERY = "UPDATE `order` SET `restaurantId` = ? ,`userId` = ? , `totalAmount` = ? ,`modeOfPayment` = ? , `status` = ? WHERE`orderId` = ?";
	static final String SELECTALL_QUERY = "SELECT * from `order`";

	static Connection connection = null;

	public OrderDaoImpl() {

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
	public void addOrder(Order order) {

		int orderId = generateUniqueOrderId();
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(INSERT_QUERY);

			prepareStatement.setInt(1, orderId);
			prepareStatement.setInt(2, order.getRestaurantId());
			prepareStatement.setInt(3, order.getUserId());
			prepareStatement.setFloat(4, order.getTotalAmount());
			prepareStatement.setString(5, order.getModeOfPayment());
			prepareStatement.setString(6, order.getStatus());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteOrder(int orderId) {

		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(DELETE_QUERY);
			prepareStatement.setInt(1, orderId);
			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Order> getAll() {

		Statement statement = null;

		ResultSet res = null;

		ArrayList<Order> orderList = new ArrayList<Order>();
		try {
			statement = connection.createStatement();
			res = statement.executeQuery(SELECTALL_QUERY);

			while (res.next()) {

				int orderId = res.getInt("orderId");
				int restaurantId = res.getInt("restaurantId");
				int userId = res.getInt("userId");
				float totalAmount = res.getFloat("totalAmount");
				String modeOfPayment = res.getString("modeOfPayment");
				String status = res.getString("status");

				Order order = new Order(orderId, restaurantId, userId, totalAmount, modeOfPayment, status);

				orderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderList;

	}

	@Override
	public Order getOrder(int orderId) {

		PreparedStatement prepareStatement = null;
		ResultSet res = null;
		Order order = null;
		try {
			prepareStatement = connection.prepareStatement(SELECT_QUERY);

			prepareStatement.setInt(1, orderId);
			res = prepareStatement.executeQuery();

			if (res.next()) {

				int restaurantId = res.getInt("restaurantId");
				int userId = res.getInt("userId");
				float totalAmount = res.getFloat("totalAmount");
				String modeOfPayment = res.getString("modeOfPayment");
				String status = res.getString("status");

				order = new Order(userId, restaurantId, userId, totalAmount, modeOfPayment, status);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public void updateOrder(Order order) {

		PreparedStatement prepareStatement = null;

		try {
			prepareStatement = connection.prepareStatement(UPDATE_QUERY);

			prepareStatement.setInt(1, order.getRestaurantId());
			prepareStatement.setInt(2, order.getUserId());
			prepareStatement.setFloat(3, order.getTotalAmount());
			prepareStatement.setString(4, order.getModeOfPayment());
			prepareStatement.setString(5, order.getStatus());

			prepareStatement.setInt(6, order.getOrderId());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	private int generateUniqueOrderId() {

		int lastOrderId = 1;
		try {
			lastOrderId = getLastOrderIdFromDatabase();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		int newOrderId = lastOrderId + 1;

		try {
			updateLastOrderIdInDatabase(newOrderId);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return newOrderId;
	}

	private int getLastOrderIdFromDatabase() throws SQLException {
		int lastOrderId = 0;
		String query = "SELECT MAX(orderid) FROM `order`"; 

		try (PreparedStatement statement = connection.prepareStatement(query);
				ResultSet resultSet = statement.executeQuery()) {
			if (resultSet.next()) {
				lastOrderId = resultSet.getInt(1);
			}
		}

		return lastOrderId;
	}

	private void updateLastOrderIdInDatabase(int newOrderId) throws SQLException {
		String query = "UPDATE last_order_id_table SET last_order_id = ?";
		

		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, newOrderId);
			statement.executeUpdate();
		}
	}

}