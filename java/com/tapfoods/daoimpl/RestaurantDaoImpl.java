package com.tapfoods.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tapfoods.dao.RestaurantDao;
import com.tapfoods.model.Restaurant;

public class RestaurantDaoImpl implements RestaurantDao {

	final static String INSERT_QUERY = "INSERT into `restaurant` (`restaurantId` , `name` , `imagePath`, `rating`,`eta`, `cuisineType` , `address`,`isActive` , `restaurantOwnerId`) values (?,?,?,?,?,?,?,?,?)";
	final static String DELETE_QUERY = "DELETE from `restaurant` WHERE `restaurantId` = ?";
	final static String SELECT_ALL_QUERY = "SELECT * from `restaurant`";
	final static String SELECT_QUERY = "SELECT * from `restaurant` WHERE `restaurantId` = ?";
	final static String UPDATE_QUERY = "UPDATE `restaurant` SET `name` = ? ,`imagePath` = ? ,`rating` = ? , `eta` = ? ,`cuisineType` = ? , `address` = ?, `isActive` = ? , `restaurantOwnerId` = ?  WHERE`restaurantId` = ?";

	static Connection connection = null;

	public RestaurantDaoImpl() {

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
	public void addRestaurant(Restaurant restaurant) {

		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(INSERT_QUERY);

			prepareStatement.setInt(1, restaurant.getRestaurantId());
			prepareStatement.setString(2, restaurant.getName());
			prepareStatement.setString(3, restaurant.getImagePath());
			prepareStatement.setFloat(4, restaurant.getRating());
			prepareStatement.setString(5, restaurant.getEta());
			prepareStatement.setString(6, restaurant.getCuisineType());
			prepareStatement.setString(7, restaurant.getAddress());
			prepareStatement.setString(8, restaurant.getIsActive());
			prepareStatement.setInt(9, restaurant.getRestaurantOwnerId());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteRestaurant(int restaurantId) {

		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(DELETE_QUERY);
			prepareStatement.setInt(1, restaurantId);
			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Restaurant> getAll() {

		Statement statement = null;

		ResultSet res = null;

		ArrayList<Restaurant> restaurantList = new ArrayList<Restaurant>();
		try {
			statement = connection.createStatement();
			res = statement.executeQuery(SELECT_ALL_QUERY);

			while (res.next()) {
				int restauantId = res.getInt("restaurantId");
				String name = res.getString("name");
				String imagePath = res.getString("imagePath");
				float rating = res.getFloat("rating");
				String eta = res.getString("eta");
				String address = res.getString("address");
				String cuisineType = res.getString("cuisineType");
				String isActive = res.getString("isActive");
				int restaurantOwnerId = res.getInt("restaurantOwnerId");

				Restaurant restaurant = new Restaurant(restauantId, name, imagePath, rating, eta, cuisineType, address, isActive, restaurantOwnerId);

				restaurantList.add(restaurant);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return restaurantList;
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {

		PreparedStatement prepareStatement = null;
		ResultSet res = null;
		Restaurant restaurant = null;

		try {
			prepareStatement = connection.prepareStatement(SELECT_QUERY);

			prepareStatement.setInt(1, restaurantId);
			res = prepareStatement.executeQuery();

			if (res.next()) {
				String name = res.getString("name");
				String imagePath = res.getString("imagePath");
				float rating = res.getInt("rating");
				String eta = res.getString("eta");
				String address = res.getString("address");
				String CuisineType = res.getString("cuisineType");
				String isActive = res.getString("isActive");
				int restauantOwnerId = res.getInt("restauantOwnerId");

				restaurant = new Restaurant(restaurantId, name, imagePath, rating, eta, CuisineType, address, isActive,
						restauantOwnerId);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return restaurant;

	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {

		PreparedStatement prepareStatement = null;

		try {
			prepareStatement = connection.prepareStatement(UPDATE_QUERY);

			prepareStatement.setString(1, restaurant.getName());
			prepareStatement.setString(2, restaurant.getImagePath());
			prepareStatement.setFloat(3, restaurant.getRating());
			prepareStatement.setString(4, restaurant.getEta());
			prepareStatement.setString(5, restaurant.getCuisineType());
			prepareStatement.setString(6, restaurant.getAddress());
			prepareStatement.setString(7, restaurant.getIsActive());
			prepareStatement.setInt(8, restaurant.getRestaurantOwnerId());

			prepareStatement.setInt(9, restaurant.getRestaurantId());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

}
