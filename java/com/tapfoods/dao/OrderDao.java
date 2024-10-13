package com.tapfoods.dao;

import java.util.List;

import com.tapfoods.model.Order;

public interface OrderDao {

	void addOrder(Order order);
	Order getOrder(int orderId);
	void updateOrder(Order order);
	void deleteOrder(int orderId);
	List<Order>getAll();
	
}
