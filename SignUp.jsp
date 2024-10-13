<%@ page import="com.tapfoods.daoimpl.UserDaoImpl" %>
<%@ page import="com.tapfoods.model.Cart" %>

	<?xml version="1.0" encoding="UTF-8" ?>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Sign-Up</title>
	
<style>
	body {
		font-family: Roboto, sans-serif;
		font-family: Arial, sans-serif;
		background-color: #e0f7fa;
		margin: 0;
		padding: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
	}
	.video-background {
		position: fixed;
		top: 0;
		left: 0;
		min-width: 100%;
		min-height: 100%;
		z-index: -1;
		overflow: hidden;
	}
	video {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: -1;
		object-fit: cover;
	}
	form {
		background-color: #ffffff;
		border-radius: 7px;
		box-shadow: 0 0 100px rgba(0, 0, 0, 0.1);
		padding: 25px;
		width: 450px;
	}
	h2 {
		text-align: center;
		color: #00796b;
	}
	h5, h6 {
		text-align: left;
		color: #00796b;
	}
	h5 a {
		text-align: left;
		color: #ff7043;
	}
	label {
		display: block;
		margin-bottom: 5px;
		color: #37474f;
	}
	input[type="text"], input[type="email"], input[type="password"], input[type="tel"], input[type="submit"] {
		width: 100%;
		padding: 8px;
		margin-bottom: 10px;
		border: 2px solid #b0bec5;
		border-radius: 4px;
		box-sizing: border-box;
		font-size: 16px;
	}
	select {
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		padding: 10px;
		border: 1px solid #b0bec5;
		border-radius: 5px;
		background-color: #ffffff;
		cursor: pointer;
	}
	select:hover {
		background-color: #e0f2f1;
	}
	select:focus {
		outline: none;
		border-color: #004d40;
	}
	input[type="submit"] {
		background-color: #00796b;
		color: white;
		border: none;
		cursor: pointer;
	}
	input[type="submit"]:hover {
		background-color: #004d40;
	}
	a {
		color: #00796b;
		text-decoration: none;
	}
	a:hover {
		text-decoration: underline;
	}
	.terms {
		font-size: 12px;
		color: #607d8b;
	}
	@media only screen and (max-width: 600px) {
		form {
			width: 80%;
		}
	}
</style>

	</head>
	<body>
	<div>
		<video class="video-background" autoplay muted loop>
        <source src="videoplayback  new.mp4" type="video/mp4">
        Your browser does not support the video tag.
    	</video>
	</div>
		<form action="CallingSignUpServlet" method="post">
				
				<h2>Sign Up</h2>
			 	<h5>Already have an account?  <a href="Login.jsp">Login to your account</a></h5>
				<label for ="name">Name:</label>
				<input type="text" id ="name" name="name" placeholder="Enter the Name" required></input>
				<label for ="email">Email:</label>
				<input type="text" id="email" name="email" placeholder="Enter the Email" required></input>
				<label for="phone">PhoneNo:</label> 
				<input type="text" id="phone" name ="phone" placeholder="Enter the PhoneNo"></input>
				<label for="address">Address:</label>
				<input type="text" id="address" name="address" placeholder="Enter the city name" required></input>
				<label for="username">UserName:</label> 
				<input type="text" id="username" name="username" placeholder ="Enter the Usernane" required></input>
				<label for="password">Password:</label> 
				<input type="password" id ="password" name ="password" placeholder ="Enter the Password" required></input>
				<div class="dropdown">
				<select name="dropdown">
					<option value="disabled selected">Role</option>
					<div class="dropdown-content">
	  				<option value="Customers">Customers</option>
	  				<option value="RestaurantOwner">RestaurantOwner</option>
	  				<option value="DeliverAgent">DeliveryAgent</option>
	  				<option value="SystemAdmin">SystemAdmin</option>
	  				</div>
				</select>
			 	</div>	
				<h5><a href="">Have referral code ?</a></h5>
				<input type="submit" value="Sign Up"></input>
				<h6 class="terms">By creating an account, I accept the <a href="#">Terms and Conditions</a>  and <a href ="#"> Privacy Policy</a></h6>
		</form>
	</body>
	</html>