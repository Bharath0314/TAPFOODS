<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Check-out</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 25px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }
        .form-group input[type="text"],
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }
        
        .form-group input[type="text"]:focus,
        .form-group select:focus {
            border-color: #007bff;
        }
        
        .form-group select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background: url('arrow.png') no-repeat center right;
            background-size: 12px;
            padding-right: 30px;
            cursor: pointer;
        }
        .btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Checkout</h2>
		<form action="CheckoutServlet" method="post">
			<div class="form-group">
				<label for="plot">Plot/Flat No:</label> <input type="text" id="plot"
					name="plot" placeholder="Enter plot/flat number">
			</div>
			<div class="form-group">
				<label for="street">Street Name:</label> <input type="text"
					id="street" name="street" placeholder="Enter street name">
			</div>
			<div class="form-group">
				<label for="pincode">Pincode:</label> <input type="text"
					id="pincode" name="pincode" placeholder="Enter pincode">
			</div>
			<div class="form-group">
				<label for="city">City:</label> <input type="text" id="city"
					name="city" placeholder="Enter city" required>
			</div>

			<div class="form-group">
				<label for="payment">Mode of Payment:</label> <select id="payment"
					name="payment">
					<option value="COD">Cash on Delivery</option>
					<option value="credit">Credit Card</option>
					<option value="debit">Debit Card</option>
					<option value="upi">UPI</option>
				</select>
			</div>
			<button type="submit" class="btn" style="width: 100%;">Confirm</button>
		</form>
	</div>

</body>
</html>
