package com.tapfoods.dao;

import java.util.List;

import com.tapfoods.model.OrderHistory;

public interface OrderHistroyDao {
	
	void addOrderHistoryItem(OrderHistory orderHistory);
	OrderHistory getOrderHistroyItem(int orderHistoryId);
	void updateOrderHistroyItem(OrderHistory orderHistory);
	void deleteOrderHistroyItem(int orderHistoryId);
	List<OrderHistory>getAll();

}
