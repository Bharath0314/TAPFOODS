<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.tapfoods.model.Restaurant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Home</title>
<style>
* {
    margin: 0;
    padding: 0;
    font-family: 'Mulish', sans-serif;
  }
/* navbar section */
.navbar {
  box-shadow: 0 15px 40px -20px rgb(40 44 63 / 15%);
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 80px;
  background: #fff;
  z-index: 1000;
  padding: 0 20px;
}
.navbar .nav {
  max-width: 1200px;
  min-width: 1200px;
  position: relative;
  margin: 0 auto;
  height: 80px;
  background: #fff;
  display: flex;
  justify-content: space-between;
}
.navbar .left {
  display: flex;
  align-items: center;
}
.navbar .left .logo {
  display: block;
  transition: transform 0.3s cubic-bezier(0.215, 0.61, 0.355, 1);
  margin-right: 10px;
}
.navbar .left .logo:hover {
  transform: scale(2.1);
}
.navbar .location-div,
.other {
  position: relative;
}
.navbar .location-div {
  display: flex;
  align-items: center;
  margin-left: 30px;
  max-width: 300px;
  height: 30px;
  cursor: pointer;
  margin-bottom: -1px;
  padding-right: 10px;
  font-size: 14px;
}
.navbar .right {
  position: relative;
}
.location-div .other {
  font-weight: 700;
  color: #3d4152;
  float: left;
  padding-bottom: 2px;
  border-bottom: 2px solid #3d4152;
}
.location-div .other:hover {
  color: #fc8019;
  border-bottom: 2px solid #fc8019;
}
.location-div .location {
  display: block;
  font-weight: 300;
  padding-left: 5px;
  margin-left: 5px;
  color: #686b78;
}
.location-div .arrow-down {
  position: absolute;
  right: -6%;
  top: 50%;
  transform: translateY(-50%);
  font-size: 1rem;
  color: #fc8019;
  font-weight: 700;
}
.right .items {
  display: flex;
  align-items: center;
}
.right .items li {
  margin-right: 36px;
  color: #3d4152;
  font-size: 16px;
  font-weight: 500;
  list-style-type: none;
}
.right .items .nav-item {
  display: flex;
  align-items: center;
  padding-left: 28px;
  position: relative;
  height: 80px;
  cursor: pointer;
}
.right .items .nav-item a {
  display: flex;
  align-items: center;
  text-decoration: none;
  color: #3d4152;
  font-size: 16px;
}
.nav-item a:hover {
  color: #fc8019;
}

.nav-item a span {
  padding-left: 11px;
}
.right .items li:last-child a svg {
  color: #60b246;
}
body, html {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	box-sizing: border-box;
}
.container {
	max-width: 1200px;
	margin: 20px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
}
.con{
	max-width: 1200px;
	margin: 20px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
}
.smallcontainer {
    width: 1450px;           
    overflow-x: auto;        
    white-space: nowrap;     
    padding: 10px 0;         
    display: flex;           
    align-items: center;     
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
}

.photo-container img {
    display: inline-block;    
    width: 150px;            
    height: 150px;           
    margin: 0;               
    border-radius: 5px;      
}
.filters ul {
            list-style-type: none; 
            padding: 10px;
            margin:0px;
            list-style-position: outside;
        }
.filters ul li {
            display: inline;
            margin-right: 10px; 
        }
.filters button{
			display: inline-flex;
            background-color: #fff; 
            border: 1px solid #d1d1d1; 
            border-radius: 24px; 
            padding: 8px 16px; 
            font-size: 16px; 
            color: #4a4a4a; 
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
            transition: background-color 0.3s, border-color 0.3s, box-shadow 0.3s; 
}
.filter button:hover {
            background-color: #f7f7f7; 
            border-color: #c1c1c1; 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15); 
        }
.filter button:active {
            background-color: #ededed; 
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2); 
        }
h1 {
	text-align: center;
	margin-bottom:20px;
	padding: 10px;
	font-family: "Times New Roman", Times, serif;
	
}

nav {
	background: white;
	overflow: hidden;
	position: sticky;
	top: 0;
	width: 100%;
	z-index: 1000;
}

nav ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: flex-end;
	
}

header {
	padding: 40px 10px;
	background: white;
	text-align: center;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	
}

nav ul li {
	
	margin-right: 20px;
	
}

 nav ul li:last-child {
        margin-right: 0; 
        
    }
nav ul li a {
	font-size: 18px;
	text-transform: uppercase;
	padding: 14px 20px;
	position: relative;
	color: black;
	text-decoration: none;
	transition: color 0.3s ease;
}

nav ul li a::before {
        content: "";
        position: absolute;
        width: 100%;
        height: 2px;
        background-color: transparent; 
        bottom: -2px;
        left: 0;
        transition: background-color 0.3s ease;
    }


nav ul li a:hover {
	color: #14279B;
	
}

nav ul li a::after {
	content: "";
	position: absolute;
	width: 100%;
	height: 2px;
	background-color: #14279B;
	bottom: -5px;
	left: 0;
	transform: scaleX(0);
	transition: transform 0.3s ease;
}

nav ul li a:hover::after {
	transform: scaleX(1);
}

.container .restaurant {
	display: inline-block;
	vertical-align: top;
}

 
   nav ul li a:hover::before {
        background-color: #14279B; 
    }

.restaurant {
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease;
	font-family: "arial", sans-serif;
	background: transparent;
	display: flex;
	flex-wrap: wrap;
	width: calc(25% - 15px);
	padding: 10px;
	box-sizing: border-box;
	margin-bottom: 20px;
	border-radius: 10px;
	box-shadow:0 4px 8px rgba(0,0,0,0.1);
	overflow: hidden;
	
}

.restaurant:hover {
	cursor: pointer;
	transform: scale(1.05);
	box-shadow:0 8px 16px rgba(0, 0,0,0.2);
}

.image-container {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 200px;
	overflow: hidden;
	border-radius:10px;
}

.image-container img {
	max-width: 100%;
	max-height: 100%;
	display: block;
	width: 200px;
	height: 200px;
	border-radius: 5px;
	margin-bottom: 10px;
	object-fit: cover;
	image-rendering: pixelated;
	transition: transform 0.3s ease;
}

.image-container::after {
	content: "";
	position: absolute;
	top: 80%;
	left: 0;
	right: 0;
	border: none;
	border-radius: 0 0 20px 20px;
	bottom: 0;
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 1)100%);
}

.restaurant h3 {
	
	color: #333;
	margin-bottom: 10px;
	font-family: Arial, sans-serif;
	text-align: center;
}

.restaurant-name {
	
	font-weight: bold;
	font-size: 25px;
	margin: 0;
	color: #555;
	margin-bottom: 5px;
	text-align: center;
}

.info-row {
	display: flex;
	align-item: center;
	justify-content: space-between;
	font-size: 18px;

}


.rating {
	display: flex;
	align-item: start;
	margin-top: 5px;
	font-weight: 600;

}

.review-count {
	margin-left: 5px;
	font-weight: 600;

}

.delivery-info {
	display: flex;
	align-items: center;
	margin-top: 5px;
}

.delivery-info i {
	margin-right: 5px;
}

.info-container {
	padding: 10px;
	text-align: center;
}

.info-container p {
	margin-bottom: 5px;
}


.bi-star-fill {
	color: green;
}

.bi-dot {
	font-size: 26px;
}

.submit-button {
	background-color: #C7C8CC;
	color: #0C0C0C;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
	justify-content: center;
	align-items: center;
	transition: background-color 0.3s ease;
}

.submit-button:hover {
	background-color: #0056b3;
	color:white;
}

.footer {
    padding: 0 20px;
    z-index: 10;
    background-color: #000;
    min-height: 298px;
    width: 100%;
    color: #fff;
    overflow: scroll;
  }
  .footer-content {
    width: 100%;
    display: flex;
    background-color: #000000;
    justify-content: space-around;
    max-width: 1200px;
    min-width: 1200px;
    margin: 0 auto;
    padding: 76px 0;
    height: 100%;
  }
  
  .points {
    color: #808080;
    font-size: 15px;
    font-weight: 600;
    width: 300px;
    margin: 26px 0px 10px 15px;
  }
  
  .footer-li {
    padding: 20px 10px 2px 0px;
  }
  
  .footer-ul {
    list-style: none;
    display: flex;
    flex-direction: column;
  }
  
  .footer-li a {
    color: #fff;
    font-size: 15px;
    font-weight: 300;
    text-decoration: none;
  }
  
  .footer-li a:hover {
    font-weight: 600;
  }
  
  .points img {
    border: 2px solid #808080;
    padding: 10px;
    margin: 30px 0px 10px 57px;
    border-radius: 10px;
    transition: transform 0.5s;
  }
  
  .points img:hover {
    transform: scale(1.06);
    cursor: pointer;
  }
</style>
</head>
<body>
<header>
 <div class="main-container">
      <header class="navbar">
        <div class="global-nav">
          <div class="nav">
            <div class="left">
              <a href="#home" class="logo">             
                  <img src="Images/logo-1.png" height="100px" width="100px"></img>            
              </a>
              <div class="location-div">
                <span class="other">Other</span>
                <span class="location">Bengaluru, Karnataka, India</span>
                <span class="arrow-down"
                  ><i class="fa-solid fa-angle-down"></i
                ></span>
              </div>
            </div>
            <div class="right">
              <ul class="items">
                <li>
                  <div class="nav-item">
                    <a href="">
                      <span>🔍Search</span>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="nav-item">
                    <a href="">
                      <span>🎁Offers</span>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="nav-item">
                    <a href="">
                      <span>📢Help</span>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="nav-item">
                    <a href="SignUp.jsp">                     
                      <span>👤Sign Up</span>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="nav-item">
                    <a href="Login.jsp">
                      <span>👤Login In</span>
                    </a>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </header> 
	</header>
	<div class="con">
	<h2>What's on your mind?</h2>
	<div class="smallcontainer">
	 <div class="photo-container">
	<img src="Images/scroll-1.png" alt="ok" />
	<img src="Images/scroll-2.png" alt="ok" />
	<img src="Images/scroll-3.png" alt="ok" />
	<img src="Images/scroll-4.png" alt="ok" />
	<img src="Images/scroll-5.png" alt="ok" />
	<img src="Images/scroll-6.png" alt="ok" />
	<img src="Images/scroll-7.png" alt="ok" />
	<img src="Images/scroll-8.png" alt="ok" />
	<img src="Images/scroll-9.png" alt="ok" />
	<img src="Images/scroll-10.png" alt="ok" />
	<img src="Images/scroll-11.png" alt="ok" />
	<img src="Images/scroll-12.png" alt="ok" />
	<img src="Images/scroll-13.png" alt="ok" />
	<img src="Images/scroll-14.png" alt="ok" />
	<img src="Images/scroll-15.png" alt="ok" />
	<img src="Images/scroll-16.png" alt="ok" />
	<img src="Images/scroll-17.png" alt="ok" />
	<img src="Images/scroll-18.png" alt="ok" />
	<img src="Images/scroll-20.png" alt="ok" />
	</div>
	</div>
	<hr></hr>
	
<div class="filters">
<ul>
<li><button>Filter</button></li>
<li><button>Sort By</button></li>
<li><button>Ratings 4.0+</button></li>
<li><button>Pure Veg</button></li>
<li><button>Offers</button></li>
<li><button>Rs. 300-Rs. 600</button></li>
<li><button>Less than Rs. 300</button></li>
</ul>
</div>
<div class="container">
    <%
    List<Restaurant> r=(List<Restaurant>)session.getAttribute("restaurantList");
        if (r != null && !r.isEmpty()) {
        	for(Restaurant restro:r){
    %>
        <div class="restaurant" >
           <div class="restItem">
			<form action="CallingMenuServlet" method="post"> 
				<input type="hidden" name="restaurantId" value="<%= restro.getRestaurantId() %>"></input>
				
				<div class="image-container">
					<img src="<%= restro.getImagePath() %>" alt="<%= restro.getName() %>"/>
				</div>
				<h3 class="restaurant-name"><b><%= restro.getName() %></b></h3>
				<div class="info-container">
					<div class="info-row">
						<div class="rating">
						<span class="rating-star"><i class="bi bi-star-fill star"></i></span>
						<span class="review-count">⭐(<%= restro.getRating() %>)</span>
						</div>
						<div class="delivery-info"><i class="bi bi-dot"></i> <span>⏰<%= restro.getEta()%></span>
						</div>
					</div>
					<p> 🍽️<%= restro.getCuisineType()%></p>
					<p> 📍<%= restro.getAddress()%></p>
					
					<div class="info-container" style="text-align: center;">
						<input type="submit" value="View Menu" class="submit-button">
					</div>
				</div>
				</form>
				</div>
				</div>
    <%
            }
        } else {
            out.println("No Restaurants found.");
        }
    %>
</div>
	<footer class="footer">
        <div class="footer-content">
          <div class="points">
            COMPANY
            <ul class="footer-ul">
              <li class="footer-li"><a href="#">About us</a></li>
              <li class="footer-li"><a href="#">Team</a></li>
              <li class="footer-li"><a href="#">Careers</a></li>
              <li class="footer-li"><a href="#">Swiggy Blog</a></li>
              <li class="footer-li"><a href="#">Bug Bounty</a></li>
              <li class="footer-li"><a href="#">Swiggy Super</a></li>
              <li class="footer-li"><a href="#">Swiggy Corporate</a></li>
              <li class="footer-li"><a href="#">Swiggy Instamart</a></li>
            </ul>
          </div>
          <div class="points">
            CONTACT
            <ul class="footer-ul">
              <li class="footer-li"><a href="#">Help & Support</a></li>
              <li class="footer-li"><a href="#">Partner with us</a></li>
              <li class="footer-li"><a href="#">Ride with us</a></li>
            </ul>
          </div>
          <div class="points">
            LEGAL
            <ul class="footer-ul">
              <li class="footer-li"><a href="#">Terms & Conditions</a></li>
              <li class="footer-li"><a href="#">Refund & Cancellation</a></li>
              <li class="footer-li"><a href="#">Privacy Policy</a></li>
              <li class="footer-li"><a href="#">Cookie Policy</a></li>
              <li class="footer-li"><a href="#">Offer Terms</a></li>
              <li class="footer-li"><a href="#">Phishing & Fraud</a></li>
            </ul>
          </div>
          <div class="points">
            <img
              src="Images/playstore-1.png"
              height="54"
            />
            <img
              src="Images/ios-1.png"
              height="54"
            />
          </div>
        </div>
	<p>&copy; 2024 Tap-Foods</p>
	</footer>
</body>
</html>