<%@ page import="java.util.List" %>
    <%@ page import="com.tapfoods.model.Menu" %>
    <%@ page import="com.tapfoods.model.Restaurant" %>
    

<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://fonts.cdnfonts.com/css/proxima-nova-condensed">
<title>Menu</title>

			<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	color: #333;
	margin: 0;
	padding: 0;
}

header {
	background-color: #2A2F4F;
	padding: 20px 0;
	text-align: center;
	color: #fff;
	margin-bottom: 20px;
}

header h1 {
	font-size: 24px;
	margin: 0;
}

.container {
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 20px;
}

.menu-item {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	display: flex;
	overflow: hidden;
	position: relative;
}

.menu-item img {
	width: 200px;
	height: 200px;
	object-fit: cover;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	padding: 10px;
}

.menu-item-content {
	padding: 20px;
	flex: 1;
}

.menu-item-name {
	font-size: 18px;
	margin-bottom: 5px;
	color: #333;
}

.menu-item-description {
	color: #666;
	margin-bottom: 10px;
}

.menu-item-price {
	font-weight: bold;
	color: #fc8019;
}

.rating-container {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.rating {
	font-weight: bold;
	margin-right: 15px;
	color: #E80F88;
}

.quantity-container {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.quantity-label {
	font-size: 16px;
	color: #333;
	margin-right: 12px;
}

.quantity-input {
	width: 60px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	outline: none;
}

.quantity-input:focus {
	border-color: #007bff;
	box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.quantity-input:required {
	border-color: #dc3545;
}

.quantity-input:invalid {
	border-color: #dc3545;
}

.form-container {
	margin-top: 10px;
}

.form-input {
	margin-right: 10px;
}

.add-button-container {
	position: absolute;
	bottom: 10px;
	right: 10px;
}

.add-button {
	background-color: #474F7A;
	font-size: 16px;
	color: #fff;
	padding: 5px 12px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.add-button span {
	font-size: 16px;
	margin: 0 5px;
}

.add-button:hover {
	background-color: #2A2F4F;
}

.footer {
	
	left: 0;
	bottom: 0;
	background-color: #2A2F4F;
	color: white;
	text-align: center;
	padding: 8px 0;
}

.bi-star-fill {
	color: green;
}

.add-button i {
	font-size: 20px;
}

@media only screen and (max-width:768px) {
	.menu-item {
		flex-direction: column;
	}
	.menu-item img {
		border-radius: 8px;
		width: 100%;
		height: auto;
	}
	.menu-item-content {
		padding: 20px;
		flex: none;
	}
	.add-button {
		float: none;
		margin-top: 20px;
	}
}
</style></head>
<body>	
	
	<header>
    	<h1>Menu</h1>
	</header>


	<div class="container">
	
	<%
		List<Menu> menuAll = (List<Menu>) request.getAttribute("Menus");

		for (Menu m : menuAll) {
		%>
			
		<div class="menu-item">
			<div class="menu-item-content">
				<h2 class="menu-item-name"><%=m.getName()%></h2>
				<p class="menu-item-description"><%= m.getDescription()%></p>
				<i class="fas fa-rupee-sign menu-item-price"><span class="menu-item-price"> <%= m.getPrice()%></span></i><br></br>
				<div class="rating-container">
				<span class="rating-star"><i class="bi bi-star-fill star"></i></span>
						<span class="rating">( <%= m.getRating() %> )</span>
				</div>
						<form action="CallingCartServlet" method="post" class="form-container">
							Quantity:<input type="number" name="quantity" value="1" min="1" class="form-input">
							<input type="hidden" name="itemId" value="<%= m.getMenuId() %>">
							<input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
							<div class="add-button-container">
								<div class="add-button">
									<input type="submit" value="Add" class="add-button">
									<input type="hidden" name="action" value="add">
								</div>
							</div>
						
						</form>
			</div>
			<img src="<%= m.getImagePath() %>" alt="Restaurant 1"> </img>
			
		</div>		
	<%
		}
	%>
	</div>
			
<footer class="footer">
    <p>&copy; 2024 Tap-Foods</p>
</footer>


</body>
</html>