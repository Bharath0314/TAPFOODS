package com.tapfoods.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tapfoods.dao.MenuDao;
import com.tapfoods.model.Menu;

public class MenuDaoImpl implements MenuDao {

	static final String INSERT_QUERY = "INSERT into `menu` (`menuId` , `name` , `price`, `description`,`imagePath`, `isAvailable` , `restaurantId`,`rating`) values (?,?,?,?,?,?,?,?)";
	static final String DELETE_QUERY = "DELETE from `menu` WHERE `menuID = ?";
	static final String SELECT_QUERY = "SELECT * from `menu` WHERE `menuId` = ?";
	static final String UPDATE_QUERY = "UPDATE `menu` SET `name` = ? ,`price` = ? ,`description` = ? , `imagePath` = ? ,`isAvailable` = ? , `restaurantId` = ?, `rating` = ? WHERE`menuId` = ?";
	static final String SELECTALL_QUERY = "SELECT * from `menu`";
	static final String SELECTBYRESTRO_QUERY = "SELECT * from `menu` WHERE `restaurantId` = ?";

	static Connection connection = null;

	public MenuDaoImpl() {

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
	public void addMenu(Menu menu) {

		PreparedStatement prepareStatement = null;

		try {
			prepareStatement = connection.prepareStatement(INSERT_QUERY);

			prepareStatement.setInt(1, menu.getMenuId());
			prepareStatement.setString(2, menu.getName());
			prepareStatement.setFloat(3, menu.getPrice());
			prepareStatement.setString(4, menu.getDescription());
			prepareStatement.setString(5, menu.getImagePath());
			prepareStatement.setBoolean(6, false);
			prepareStatement.setInt(7, menu.getRestaurantId());
			prepareStatement.setFloat(8, menu.getRating());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {

		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(DELETE_QUERY);
			prepareStatement.setInt(1, menuId);
			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId) {

		PreparedStatement prepareStatement = null;
		ResultSet res = null;
		Menu menu = null;
		try {
			prepareStatement = connection.prepareStatement(SELECT_QUERY);

			prepareStatement.setInt(1, menuId);
			res = prepareStatement.executeQuery();

			if (res.next()) {

				String name = res.getString("name");
				float price = res.getFloat("price");
				String description = res.getString("description");
				String imagePath = res.getString("imagePath");
				boolean isAvailable = res.getBoolean("isAvailable");
				int restaurantId = res.getInt("restaurantId");
				float rating = res.getFloat("rating");

				menu = new Menu(menuId, name, price, description, imagePath, isAvailable, restaurantId, rating);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public void updateMenu(Menu menu) {

		PreparedStatement prepareStatement = null;

		try {
			prepareStatement = connection.prepareStatement(UPDATE_QUERY);

			prepareStatement.setString(1, menu.getName());
			prepareStatement.setFloat(2, menu.getPrice());
			prepareStatement.setString(3, menu.getDescription());
			prepareStatement.setString(4, menu.getImagePath());
			prepareStatement.setBoolean(5, false);
			prepareStatement.setInt(6, menu.getRestaurantId());
			prepareStatement.setFloat(7, menu.getRating());

			prepareStatement.setInt(8, menu.getMenuId());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	@Override
	public List<Menu> getAll() {

		Statement statement = null;

		ResultSet res = null;

		ArrayList<Menu> menuList = new ArrayList<Menu>();
		try {
			statement = connection.createStatement();
			res = statement.executeQuery(SELECTALL_QUERY);

			while (res.next()) {

				int menuId = res.getInt("menuId");
				String name = res.getString("name");
				float price = res.getFloat("price");
				String description = res.getString("description");
				String imagePath = res.getString("imagePath");
				boolean isAvailable = res.getBoolean("isAvailable");
				int restaurantId = res.getInt("restaurantId");
				float rating = res.getFloat("rating");

				Menu menu = new Menu(menuId, name, price, description, imagePath, isAvailable, restaurantId, rating);

				menuList.add(menu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menuList;

	}

	@Override
	public List<Menu> getMenuByResto(int restauratId) {

		PreparedStatement statement = null;

		ResultSet res = null;

		ArrayList<Menu> menuList = new ArrayList<Menu>();
		try {
			statement = connection.prepareStatement(SELECTBYRESTRO_QUERY);
			statement.setInt(1, restauratId);
			res = statement.executeQuery();

			while (res.next()) {

				int menuId = res.getInt("menuId");
				String name = res.getString("name");
				float price = res.getFloat("price");
				String description = res.getString("description");
				String imagePath = res.getString("imagePath");
				boolean isAvailable = res.getBoolean("isAvailable");
				int restaurantId = res.getInt("restaurantId");
				float rating = res.getFloat("rating");

				Menu menu = new Menu(menuId, name, price, description, imagePath, isAvailable, restaurantId, rating);

				menuList.add(menu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menuList;

	}

}
