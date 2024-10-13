package com.tapfoods.dao;

import java.util.List;

import com.tapfoods.model.User;

public interface UserDao {
	void addUser(User user);
	User getUser(int userId);
	void updateUser(User user);
	void deleteUser(int userId);
	List<User>getAllUser();
	public boolean isValidUser(String userName, String password);
	void addUserSignUp(User user);
	User getUserByuserNameAndPassword(String userName, String Password);
}
