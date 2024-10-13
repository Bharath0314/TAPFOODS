<%@ page import="com.tapfoods.model.Cart" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.tapfoods.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You for Your Order</title>
    <style>
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        
        header {
            background-color: #2A2F4F;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 32px;
            font-weight: 700;
            margin: 0;
        }

        
        .content {
            padding: 20px;
        }

    	.confirmation-message {
            margin-bottom: 20px;
            text-align: center;
            font-size: 20px;
        }    
	        
        .order-summary {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .order-summary th, .order-summary td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        .order-summary th {
            background-color: #082032;
            color: #fff;
            font-weight: 700;
            text-align: left;
        }

        .order-summary tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .order-summary tbody tr:nth-child(odd) {
            background-color: #fff;
        }

        /* Total price section styles */
        .total-price {
            margin-top: 20px;
            text-align: right;
        }

        .total-price p {
            font-size: 24px;
            font-weight: 700;
            padding: 10px;
        }

        /* Button styles */
        
        .button-container {
    		display: flex;
  			justify-content: space-between;
  			float:hidden;
		}
        
        .confirm-btn, .Cancel-btn  {
            background-color:  #082032;;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .confirm-btn:hover,  .Cancel-btn:hover  {
            background-color: #334756;
        }
       
       
    </style>
</head>
<body>
    <header>
        <h1>Thank You for Your Order</h1>
    </header>
    <div class="container">
        <div class="content">
            <div class="confirmation-message">
                <p>Your order has been successfully placed!</p>
            </div>
            <div class="cart-summary">
                <h2>Order Summary</h2>
                <table class="order-summary">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Cart cart = (Cart) session.getAttribute("cart");
                            if (cart != null) {
                                double totalPrice = (double) session.getAttribute("totalPrice");
                                DecimalFormat df = new DecimalFormat("#.##");

                                for (CartItem item : cart.getItems().values()) {
                                    double itemTotal = item.getPrice() * item.getQuantity();
                        %>
                        <tr>
                            <td><%= item.getName() %></td>
                            <td>&#x20B9;<%= item.getPrice() %></td>
                            <td><%= item.getQuantity() %></td>
                            <td>&#x20B9;<%= df.format(itemTotal) %></td>
                        </tr>
                        <% 
                                
                            }
                        %>
                    </tbody>
                </table>
                <div class="total-price">
                    <% if (session.getAttribute("totalPrice") != null) { %>
                        <p>Total Price: &#x20B9;<%= df.format(totalPrice) %></p>
                    <% }
                    }%>
                </div>
            </div>
            <div class="button-container">
           	 	<button class="confirm-btn" onclick="window.location.href='confirmation2.jsp'">Confirm</button>
            	<button class="Cancel-btn" onclick="window.location.href='RestaurantMain.jsp'">Cancel</button>
            </div>
        </div>
    </div>
</body>
</html>
