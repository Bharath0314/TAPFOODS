<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Status</title>
    <style>
        /* Reset CSS */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        /* Global styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            text-align: center;
        }

        .container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
            color: #334756; /* Updated heading color */
        }

        p {
            font-size: 18px;
            color: #555; /* Updated paragraph color */
            margin-bottom: 20px;
        }

        .status {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .button-container {
    		display: flex;
  			justify-content: space-between;
  			float:hidden;
		}

        .back-btn, .Cancel-btn{
            background-color: #334756;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover, .Cancel-btn:hover {
            background-color: #001f3f; /* Darker shade on hover */
        }
        
         
        
        
       
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Status</h2>
        <p>Your order with ID <%= request.getParameter("orderId") %> is currently:</p>
        <div class="status">
            <%= "Your Order will be dispatched soon !!" %>
        </div>
        <div class="button-container">
        <a href="Trackorder.jsp" class="back-btn">Back to Track Order</a>
        <button class="Cancel-btn" onclick="window.location.href='RestaurantMain.jsp'">Home</button>
        </div>
    </div>
</body>
</html>
