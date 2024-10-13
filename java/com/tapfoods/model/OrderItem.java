package com.tapfoods.model;

public class OrderItem {

	private int orderItemId;
	private int userId;
	private int restaurantId;
	private int menuId;
	private String itemName;
	private double rating;
	private int quantity;
	private double price;
	private double totalAmount;
	private String imagePath;
	public OrderItem() {

	}
	public OrderItem(int orderItemId, int userId, int restaurantId, int menuId, String itemName, double rating,
			int quantity, double price, double totalAmount, String imagePath) {
		super();
		this.orderItemId = orderItemId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.menuId = menuId;
		this.itemName = itemName;
		this.rating = rating;
		this.quantity = quantity;
		this.price = price;
		this.totalAmount = totalAmount;
		this.imagePath = imagePath;
	}
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	
}
