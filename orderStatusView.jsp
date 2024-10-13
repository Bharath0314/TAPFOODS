<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>OrderStatus</title>
</head>
<body>
	
	<div class="container">
        <h2>Order Status</h2>
        <p>Your order with ID <%= request.getParameter("orderId") %> is currently:</p>
        <div class="status">
            <%= request.getAttribute("status") %>
        </div>
        <a href="trackorder.jsp" class="back-btn">Back to Track Order</a>
    </div>
	
	
</body>
</html>