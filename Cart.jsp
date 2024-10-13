<%@ page import="com.tapfoods.model.Cart" %>
<%@ page import="com.tapfoods.model.CartItem" %>
<%@ page import="com.tapfoods.model.Restaurant" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Cart</title>

<style>
	
	body {
		font-family: Arial, sans-serif;
	}
	
.cart-item {
	border: 2px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	width: 710px;
	margin: 0 auto;
	max-width: 800px;
	margin-top: 10px;
	padding-top: 20px;
	padding-bottom: 20px;
}

header {
	background-color: #2A2F4F;
	padding: 20px 0;
	text-align: center;
	color: #fff;
}

header h1 {
	font-size: 24px;
	margin: 0;
}

.top-image-container {
    text-align: center;
}

.top-image {
    max-width: 100%;
    height: auto;
}

.empty-cart-msg {
    font-size: 24px;
    font-weight: bold;
    color: #555;
    margin-top: 20px;
}

.menu-items {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: center;
}

.menu-item {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	width: calc(50% - 22px); /* Adjust width as needed */
	box-sizing: border-box;
	margin-bottom: 20px;
}

.item-details {
	margin-bottom: 10px;
}

.item-details p {
	margin: 0;
	font-weight: bold;
}

.price {
	color: #888;
}

.quantity-controls {
	display: flex;
	align-items: center;
}

.quantity-controls input[type="submit"], 
.quantity-controls input[type="number"] {
	margin-right: 10px;
}

.remove-btn, 
.update-btn {
	background-color: #f44336;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

.remove-btn:hover, .update-btn:hover {
	background-color: #d32f2f;
}

.add-more-item-btn, .proceed-to-checkout-btn {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 10px;
	gap: 20px;
}

.add-more-item-btn:hover, .proceed-to-checkout-btn:hover {
	background-color: #45a049;
}

.proceed-buttons-container {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.add-more-button, .checkout-button {
	flex: 1;
	text-align: center;
}

</style>

</head>
<body>

<header>
    <h1>Cart</h1>
</header>

<div class="cart-item">
    <div class="menu-items">
        <!-- Cart Items -->
        <% 
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null && !cart.getItems().isEmpty()) {
            for (CartItem item : cart.getItems().values()) {
        %>
        <div class="menu-item" id="<%=item.getItemId()%>">
            <div class="item-details">
                <p><%=item.getName()%></p>
                <span class="price">&#x20B9;<%=item.getPrice()%></span>
                <form action="CallingCartServlet" method="post">
                    <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
                    <div class="quantity-controls">
                        <input type="submit" name="action" value="remove" class="remove-btn">
                        <input type="number" name="quantity" value="<%=item.getQuantity()%>" min="1">
                        <input type="submit" name="action" value="update" class="update-btn">
                    </div>
                </form>
            </div>
        </div>
        <% 
            }
        } else { 
        %>
        <div class="top-image-container">
            <img src="data:image/png;base64,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" alt="Top Image" class="top-image">
            <p class="empty-cart-msg">Your Cart Is Empty</p>
        </div>
        <% 
        } 
        %>
    </div>
    
    <div class="proceed-buttons-container">
        <div class="add-more-button">
            <a href="CallingMenuServlet?restaurantId=<%=session.getAttribute("restaurantId")%>" class="btn add-more-item-btn">Add More</a>
        </div>
        <div class="checkout-button">
            <% if (session.getAttribute("cart") != null && !cart.getItems().isEmpty()) { %>
            <form action="checkout.jsp" method="post">
                <input type="submit" value="Proceed to Checkout" class="btn proceed-to-checkout-btn">
            </form>
            <% } %>
        </div>
    </div>

</div>


</body>
</html>
