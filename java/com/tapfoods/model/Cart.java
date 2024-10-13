package com.tapfoods.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

	private Map<Integer, CartItem> items;

	public Cart() {
		this.items = new HashMap<>();
	}

	public void addItem(CartItem newItem) {
		int itemId = newItem.getItemId();

		if (items.containsKey(itemId)) {
			CartItem Cartitems = items.get(itemId);
			Cartitems.setQuantity(Cartitems.getQuantity() + newItem.getQuantity());
		} else {
			items.put(itemId, newItem);
		}
	}

	public void updateItem(int itemId, int quantity) { // Corrected spelling mistake in method name
		if (items.containsKey(itemId)) {
			if (quantity <= 0) {
				items.remove(itemId);
			} else {
				items.get(itemId).setQuantity(quantity);
			}
		}
	}

	public void removeItem(int itemId) {
		items.remove(itemId);
	}

	public Map<Integer, CartItem> getItems() {
		return items;
	}

	public void clear() {
		items.clear();
	}
}