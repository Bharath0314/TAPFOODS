package com.tapfoods.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tapfoods.dao.UserDao;
import com.tapfoods.model.PasswordEncryption;
import com.tapfoods.model.User;

public class UserDaoImpl implements UserDao {

	final static String INSERT_QUERY = "INSERT into `user` (`name` , `email`, `phoneNo`,`address`, `userName` , `password`,`role`,`lastLogin`) values (?,?,?,?,?,?,?,?)";
	final static String SELECT_QUERY = "SELECT * from `user` WHERE `userId` = ?";
	final static String UPDATE_QUERY = "UPDATE `user` SET `name` = ? ,`email` = ? ,`phoneNo` = ? , `address` = ? ,`userName` = ? , `password` = ?, `role` = ? , `createdDate` = ? , `lastLogin` = ? WHERE`userId` = ?";
	final static String DELETE_QUERY = "DELETE from `user` WHERE `userId` = ?";
	final static String SELECTALL_QUERY = "SELECT * from `user`";
	final static String SELECTBYUSERANDPASS = "SELECT * from `user` WHERE `userName` = ? AND `password` = ?";
	final static String USERNAMEVALID = "SELECT COUNT(*) FROM `user` WHERE userName = ?";
	final static String INSERT_QUERY_BY_SIGNUP = "INSERT into `user` (`name` , `email`, `phoneNo`,`address`, `userName` , `password`,`role`) values (?,?,?,?,?,?,?)";

	static Connection connection;

	public UserDaoImpl() {
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
	public void addUser(User user) {

		PreparedStatement prepareStatement = null;

		try {
			prepareStatement = connection.prepareStatement(INSERT_QUERY);
			prepareStatement.setString(1, user.getName());
			prepareStatement.setString(2, user.getEmail());
			prepareStatement.setString(3, user.getPhoneNo());
			prepareStatement.setString(4, user.getAddress());
			prepareStatement.setString(5, user.getUserName());
			String encryptedPassword = PasswordEncryption.encryption(user.getPassword());
			prepareStatement.setString(6, encryptedPassword);
			prepareStatement.setString(7, user.getRole());
			System.out.println(user.getUserName());
			System.out.println(user.getPassword());
			System.out.println(user.getName());
			System.out.println(user.getEmail());
			System.out.println(user.getAddress());
			System.out.println(user.getRole());
			System.out.println(user.getPhoneNo());
			LocalDateTime lastlogin = user.getLastlogin();
			if (lastlogin != null) {
				prepareStatement.setTimestamp(8, Timestamp.valueOf(lastlogin));
			} else {
				prepareStatement.setNull(8, Types.TIMESTAMP);
			}

			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public User getUser(int userId) {

		PreparedStatement prepareStatement = null;
		ResultSet res = null;
		User user = null;
		try {
			prepareStatement = connection.prepareStatement(SELECT_QUERY);

			prepareStatement.setInt(1, userId);
			res = prepareStatement.executeQuery();

			if (res.next()) {
				String name = res.getString("name");
				String email = res.getString("email");
				String phoneNo = res.getString("phoneNo");
				String address = res.getString("address");
				String userName = res.getString("userName");
				String password = res.getString("password");
				String role = res.getString("role");
				LocalDateTime createdDate = res.getTimestamp("createdDate").toLocalDateTime();
				LocalDateTime lastLogin = res.getTimestamp("lastLogin").toLocalDateTime();

				user = new User(userId, name, email, phoneNo, address, userName, password, role, createdDate,
						lastLogin);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void updateUser(User user) {

		PreparedStatement prepareStatement = null;

		try {
			prepareStatement = connection.prepareStatement(UPDATE_QUERY);

			prepareStatement.setString(1, user.getName());
			prepareStatement.setString(2, user.getEmail());
			prepareStatement.setString(3, user.getPhoneNo());
			prepareStatement.setString(4, user.getAddress());
			prepareStatement.setString(5, user.getUserName());
			prepareStatement.setString(6, user.getPassword());
			prepareStatement.setString(7, user.getRole());
			prepareStatement.setTimestamp(8, Timestamp.valueOf(user.getCreatedDate()));
			prepareStatement.setTimestamp(9, Timestamp.valueOf(user.getLastlogin()));

			prepareStatement.setInt(10, user.getUserId());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	@Override
	public void deleteUser(int userId) {

		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(DELETE_QUERY);
			prepareStatement.setInt(1, userId);
			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<User> getAllUser() {

		Statement statement = null;

		ResultSet res = null;

		ArrayList<User> userList = new ArrayList<User>();
		try {
			statement = connection.createStatement();
			res = statement.executeQuery(SELECTALL_QUERY);

			while (res.next()) {
				int userId = res.getInt("userId");
				String name = res.getString("name");
				String email = res.getString("email");
				String phoneNo = res.getString("phoneNo");
				String address = res.getString("address");
				String userName = res.getString("userName");
				String password = res.getString("password");
				String role = res.getString("role");
				LocalDateTime createdDate = res.getTimestamp("createdDate").toLocalDateTime();
				LocalDateTime lastLogin = res.getTimestamp("lastLogin").toLocalDateTime();

				User user = new User(userId, name, email, phoneNo, address, userName, password, role, createdDate,
						lastLogin);
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public boolean isValidUser(String userName, String encryptedPassword) {

		PreparedStatement prepareStatement = null;

		ResultSet res = null;
		boolean isValid = false;
		try {
			prepareStatement = connection.prepareStatement(SELECTBYUSERANDPASS);

			prepareStatement.setString(1, userName);
			//String decryptedPassword = PasswordEncryption.decryption(encryptedPassword);
	        prepareStatement.setString(2, encryptedPassword);

			res = prepareStatement.executeQuery();

			if (res.next()) {
				isValid = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isValid;
	}

	public boolean isUserExists(String userName) {

		boolean exists = false;
		PreparedStatement prepareStatement = null;
		ResultSet res = null;

		try {
			prepareStatement = connection.prepareStatement(USERNAMEVALID);
			prepareStatement.setString(1, userName);

			res = prepareStatement.executeQuery();

			if (res.next()) {
				int c = res.getInt(1);
				exists = c > 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exists;
	}

	@Override
	public void addUserSignUp(User user) {

		try {
			PreparedStatement prepareStatement = connection.prepareStatement(INSERT_QUERY_BY_SIGNUP);
			prepareStatement.setString(1, user.getUserName());
			prepareStatement.setString(2, user.getEmail());
			prepareStatement.setString(3, user.getPhoneNo());
			prepareStatement.setString(4, user.getAddress());
			prepareStatement.setString(5, user.getUserName());
			prepareStatement.setString(6, user.getPassword());
			prepareStatement.setString(7, user.getRole());

			String encrptedPassword = encryption(user.getPassword());

			prepareStatement.setString(6, encrptedPassword);

			prepareStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	@Override
	public User getUserByuserNameAndPassword(String userName, String password) {

		ResultSet res = null;
		User user = null;

		try {
			PreparedStatement prepareStatement = connection.prepareStatement(SELECTBYUSERANDPASS);

			prepareStatement.setString(1, userName);

			String encryotedPassword = encryption(password);

			prepareStatement.setString(2, encryotedPassword);

			res = prepareStatement.executeQuery();

			if (res.next()) {

				userName = res.getString("userName");
				password = res.getString("password");

				user = new User(userName, encryotedPassword);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	public static String encryption(String s) {
		String t = "";
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			c = (char) (c + 1);
			t = t + c;
		}
		return t;
	}

	public static String decryption(String s) {
		String t = "";
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			c = (char) (c - 1);
			t = t + c;
		}
		return t;
	}

}