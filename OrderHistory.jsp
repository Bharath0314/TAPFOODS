<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import=" com.tapfoods.model.OrderItem" %>
    <%@ page import=" com.tapfoods.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tap Foods</title>
<link rel="icon" href="http://localhost:8080/tapfoods/Images/icon.png">
 <style>
        body{
            background-color: #B7C8E9;
            
        }
       ::-webkit-scrollbar {
	width: 5px;
}

::-webkit-scrollbar-thumb {
	background: #fca311;
	border-radius: 20px;
}
nav {
	height: 75px;
	width: 101.5%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	background-color: rgba(255, 255, 255, 0.9);
	margin: -6% 0% 0% -1%;
	position: fixed;
	z-index: 999;
}

nav .logo {
	margin: 0.2% 0% 0% 0.5%;
}

nav .logo img {
	margin: 10% 0% 0% -8%;
	height: 30vh;
	width: 100%;
}

nav ul {
	list-style: none;
	display: flex;
	gap: 30px;
	margin-right: 30px;
	margin-top: 35px;
	text-shadow: 1px 1px 1px gray;
}

nav a {
	text-decoration: none;
	color: black;
	font-size: 25px;
	margin-top: 1%;
}

nav  a:hover {
	color: #fca311;
}

nav .profile {
	position: relative;
	border-radius: 50%;
	height: 8vh;
	width: 48px;
	margin: -12% 0% 0% 12%;
	background:
		url("https://cdn.pixabay.com/photo/2016/08/31/11/54/icon-1633249_1280.png");
	background-size: 40px;
	background-position: 4.5px;
	background-repeat: no-repeat;
	box-shadow: 0px 0px 7px black;
	cursor: pointer;
	border-radius: 50%;
}

.profile-details {
	display: none;
	flex-direction: column;
	position: fixed;
	width: 25vw;
	border: 1px solid;
	background-color: rgba(0, 0, 0, 0.9);
	border-radius: 10px 10px 10px 10px;
	margin: -1.8% 0% 0% 70.5%;
	box-shadow: 0px 0px 7px black;
	z-index:999;
}

.profile-details .profilepic {
	border-radius: 50%;
	height: 50px;
	width: 45px;
	margin: 24px 20px 0px 20px;
	box-shadow: 0px 0px 7px black;
	background:
		url("https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_1280.png");
	background-size: cover;
	background-position: -2px;
	background-repeat: no-repeat;
}

.profile-details .name {
	width: 70%;
	margin: -15% 0% 0% 20%;
	align-content: center;
	font-size: 3vw;
	padding-left: 5%;
	color: #ffff;
}

.profile-details .userName {
	width: 90%;
	margin: 10% 0% 0% 5%;
	align-content: center;
}

.profile-details .email {
	width: 90%;
	margin: 10% 0% 0% 5%;
}

.profile-details .phoneNo {
	width: 90%;
	margin: 10% 0% 0% 5%;
}

.profile-details .address {
	width: 90%;
	margin: 10% 0% 0% 5%;
}

.profile-details .titles {
	color: orange;
	font-size: 100%;
	padding-left: 5%;
}

.profile-details .values {
	color: #ffff;
	font-size: 120%;
}


.profile-details .logout-edit {
	margin: 7% 0% 5% 5%;
	display:flex;
	justify-content: space-around;
}


.profile-details .logout-edit .log{
margin-left:-15%;
}
.profile-details .logout-edit a {
	color: orange;
	margin: 0% 0% 0% 5%;
	font-size:2vw;
}

.profile-details .logout-edit a:hover {
	color: #ffff;
}

.profile-details .logout a:hover {
	color: #ffff;
}
        .container{
            margin-left: 8%;
	margin-top: 6%;
	width: 85%;
    background-color: #ffff;
    font-size:1.5vw;
        }
        .con{
            margin-left: 10%;

	width: 80%;
    background-color: #ffff;
    display: flex;
    gap:35%;
    padding:1%;
    border-bottom: 1px solid  #B7C8E9;
        }
       
        .con .name{
        margin:0% 0% 0% 18%;
        }
        .con .pri{
        margin:0% 0% 0% 4%;
        }
        .con .quantity{
        margin:0% 0% 0% -24%;
        }
      
      .items  .container1{
	margin-top: 0.5%;
    background-color: #ffff;
    display:flex ;
    justify-content: space-around;
        }
        .container1 .item-pic img{
        width:100px; 
        height:80px;
        border-radius:10px;
         margin:2% 6% 2%  10%;
        }
        .container1 .name{
            margin:2% 6% 2%  0%;
            font-size: 1.7vw;
            width:30vw;
            overflow-x: hidden;
            padding: 0.5%;
        }
        .container1 .price{
            margin:2% 0% 2%  -8%;
            font-size: 1.7vw;
            width:6vw;
            overflow-x: hidden;
            padding: 0.5%;
        }
       
        
        
        .container1  .quan{
            font: size 30px;
            margin:2% 0% 0%  0%;
            width:2.5vw;
            height: 5vh;
            display: flex;
            justify-content: center;
            align-items: center;
           
        }
        .container1 .reorder{
            font-size: 2vw;
            color:#fca311;
            margin: 20% 0% 0% 0%;
        }
        .container1 .reorder:hover{
            color: green;
        }
        a{
        text-decoration: none;
       
        }
        
         .container3{
	margin-top: 7%;
	padding-bottom:5%;
    background-color: #ffff;

        }

.container3 .additemstext{
      border: 1px solid #B7C8E9;
            box-shadow: 0.1px 0.1px 3px 0.1px #c9d8f7;
            width:17.5vw;
            padding: 1%;
            font-size: 1.5vw;
            cursor: pointer;
            margin-left: -140%;
}
.container3  a{
text-decoration: none;
color: black;
}
.container3 .additemstext:hover{
background-color:#B7C8E9;
}
.text{
margin:2% 0% 0% 15%;
}
        
    </style>
</head>
<body>
<nav>
		<div class="logo">
			<a href="#"><img
				src="http://localhost:8080/tapfoods/Images/MainLogo.png" alt="logo"></a>
		</div>
		<ul>


			<a href="Restaurant.jsp"><li class="elements"><b>Home</b></li></a>
			<a href="orderhistory"><li class="elements"><b>Order
						History</b></li></a>
			<a href="ViewCart.jsp"><li class="elements"><b>View Cart</b></li></a>
			<li><div class="profile" id="profile"></div></li>

		</ul>
	</nav>
							<!--pop up profile  -->
	<div class="profile-details" id="profile-details">

		<%
		User user = (User) session.getAttribute("user");
		session.setAttribute("userId", 1);
		%>
		<div class="profilepic"></div>
		<div class="name"><%=user.getName()%></div>
		<div class="userName">
			<span class="titles">USERNAME :</span><span class="values"> <%=user.getUserName()%></span>
		</div>
		<div class="email">
			<span class="titles">EMAIL : </span><span class="values"><%=user.getEmail()%></span>
		</div>
		<div class="phoneNo">
			<span class="titles">PHONENO :</span><span class="values"> <%=user.getPhoneNo()%></span>
		</div>
		<div class="address">
		<%if(user.getAddress()!=null)
		{
		 %>
			<span class="titles">ADDRESS :</span><span class="values"> <%=user.getAddress()%></span>
		<% }
		else
		{
		%>
		<span class="titles">ADDRESS :</span><span class="values"><a href="calledit?menu=menu">Add Address</a></span>
		<%}
		%>
		
		</div>

		<div class="logout-edit">
			<div class="log"><a href="indexservlet">LogOut</a></div> <div class="edit"><a href="calledit?isthishistory=history">Edit</a></div>
		</div>

	</div>
    <div class="container">
    
    <div class="con"><div class="name">ItemName</div><div class="pri">Price</div><div class="quantity">Quantity</div></div>
    <%List<OrderItem> AllOrderItems=(List<OrderItem>)session.getAttribute("allOrderItems");
    if(AllOrderItems!=null && !(AllOrderItems.isEmpty())){
for(OrderItem orderItems:AllOrderItems){
%>
    <div class="items">
    <div class="container1">
     <div class="name"> <%=orderItems.getItemName() %></div>
     <div class="price">₹ <%=orderItems.getPrice() %></div>
    <div class="quan"> <%=orderItems.getQuantity()%></div>
    
    <a href="callcart?itemId=<%=orderItems.getMenuId() %>&itemName=<%=orderItems.getItemName() %>&price=<%=orderItems.getPrice() %>&restaurantid=<%=orderItems.getUserId() %>">
					<div class="reorder">Re-Order</div></a>
    </div>
    
</div>
<% 	
}
%>	
<%
}
else{
	%>
	<div class="items">
    <div class="container1">
     <div class="text">It's Look like you are not ordered any things in Tap food</div>
     <div class="container3">
		<a href="Restaurantservlet"><div class="additemstext"> SEE RESTAURANTS &nbsp; &#10140;</div></a>
		</div> 
     </div>
    
</div>

<%
}
%>
  
   
</div>
<script type="text/javascript">
document.getElementById("profile").addEventListener('mouseover',function(){
	document.getElementById("profile-details").style.display = "flex";
});

document.getElementById("profile").addEventListener('mouseleave',function(){
	document.getElementById("profile-details").style.display = "none";
});

document.getElementById("profile-details").addEventListener('mouseover',function(){
	document.getElementById("profile-details").style.display = "flex";
});

document.getElementById("profile-details").addEventListener('mouseleave',function(){
	document.getElementById("profile-details").style.display = "none";
});
</script>
</body>
</html>