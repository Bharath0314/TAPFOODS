<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.tapfoods.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tap Foods</title>
<link rel="icon" href="http://localhost:8080/tapfoods/Images/icon.png">
<style>
body {
background-color:  #B7C8E9;
	display: flex;
	justify-content: center;
	margin-top: 75px;
	
}

.box {
	height: 500px;
	width: 400px;
	display: grid;
	justify-content: center;
	align-items: center;
	box-shadow: 2px 2px 5px 5px gray;
	border-radius: 20px;
	background-color:  #ffff;
}

.form {
	margin-top: -50px;
}

.signup h1 {
	font-size: 40px;
	text-decoration: underline;
	text-decoration-color: #fca311;
}

.inputbox1, .inputbox2, .inputbox3, .inputbox4, .inputbox5 {
	width: 256px;
	border-bottom: 2px solid;
	padding-top: 20px;
	display: flex;
	cursor: text;
}
#name{
 text-transform: capitalize;
}

.inputbox1 input, .inputbox2 input, .inputbox3 input, .inputbox4 input,
	.inputbox5 input {
	width: 90%;
	height: 27px;
	border: none;
	outline: none;
	background: transparent;
	font-size: 15px;
	cursor: text;
}

.inputbox1 label, .inputbox2 label, .inputbox3 label, .inputbox4 label,
	.inputbox5 label {
	position: absolute;
	padding-top: 10px;
	color: #fca311;
	font-weight: 900;
	cursor: text;
	transition: font-size 0.5s ease;
}

.inputbox1 input:focus ~label, .inputbox1 input:valid ~label {
	top: 180px;
	font-size: 13px;
	transition: font-size 0.2s ease;
}


.inputbox2 input:focus ~label, .inputbox2 input:valid ~label {
	top: 230px;
	font-size: 13px;
	transition: font-size 0.2s ease;
}

.inputbox3 input:focus ~label, .inputbox3 input:valid ~label {
	top: 280px;
	font-size: 13px;
	transition: font-size 0.2s ease;
}

.inputbox4 input:focus ~label, .inputbox4 input:valid ~label {
	top: 330px;
	font-size: 13px;
	transition: font-size 0.2s ease;
}

.inputbox5 label{
top: 380px;
	font-size: 13px;
}


.inputbox5 img {
	padding-right: 2px;
	height: 25px !important;
	cursor: pointer;
}

.submit {
	padding-top: 24px;
	padding-left: 197px;
}

.submit input {
	font-size: 17px;
	font-weight:500;
	padding: 4px;
	background-color: #fca311;
	border-radius: 10px 2px;
}

.submit input:hover {
	
	background-color: white;
	
}

.login a {
	text-decoration: none;
	color: #fca311;
	padding-left: 10px;
	font-size: 17.5px;
}

.login a:hover {
	color:black;
}
  #name-error,#email-error,#phoneNo-error,#username-error,#address-error{
            width:190px;
            color: red;
            margin-top: 2%;
        }
        .v{

           margin-left: 82%;
        }
        .en{
            
            width:100px;
            margin-left: 37%;
        }
         .epn {
            position: absolute;

            width:190px;
            margin-left: 0%;
        }
         #name-error  .efn{
            margin-left: 12%;
        }
         #username-error .en{
            
            width:150px;
            margin-left: 31%;
        }
       #username-error .epn {
            position: absolute;
            font-size:13px ;
            width:250px;
            margin:-1.4% 0% 0% -5.5%;
        }
        #username-error .efn{
            
            width:250px;
            margin-left: 10%;
        }
        #phoneNo-error .en{
            width:100px;
            margin-left: 18%;
        }
        #phoneNo-error .epn{
            position: absolute;

            width:230px;
            margin-left: -3%;
        }
         #submit-error .submiterror{
        position: absolute;
        font-weight: 550;
        margin:-1.8% 0% 0% -1.3%;
        color:red;
       }
        
.em{
position:absolute;
color:red;
font-size:14px;
margin:27% 0% 0% -1%;
}
.errormessage{
position:absolute;
color:red;
font-size:14px;
margin:1% 0% 0% 1%;
}
.over{
font-size: 14px;
color:black;
}
</style>
</head>
<body>
<body>
	<div class="box">
		<div class="signup">
			<h1>Edit</h1>
		</div>
		<%
		User user = (User) session.getAttribute("user");
		%>
		<div class="form">
			<form action="udateuserdetails" method="post" onsubmit="return validateAll()">
				<div class="inputbox1">
					<input type="text" id="name" name="name" required value="<%=user.getName() %>" onkeyup=" return validateName()"> <label
						for="name">Name</label>
						<span id="name-error"></span> <br>
				</div>
				<div class="inputbox2">
				
					<input type="text" id="userName" name="userName" required value="<%=user.getUserName()%>" onkeyup="return validateUserName()"> <label
						for="userName">UserName</label>
						<span id="username-error"></span> <br>
				</div>
				<div class="inputbox3">
				<input type="email" id="email" name="email" required title="Format : alex@gmail.com" value="<%=user.getEmail()%>" onkeyup="return validateEmail()"> <label
						for="email">Email</label>
						<span id="email-error"></span> <br>
				</div>
				<div class="inputbox4">
				<input type="tel" id="phoneNo" name="phoneNo" required   value="<%=user.getPhoneNo() %>" onkeyup="return validatePhoneNo()">
					<label for="phoneNo">PhoneNo</label>
					<span id="phoneNo-error"></span> <br>
				</div>
			
				<div class="inputbox5">
				<%if(user.getAddress()!=null)
		{
		 %>
					<input type="text" id="address" name="address" required value="<%=user.getAddress() %>" onkeyup="return validateAddress()">
					<% }
		else
		{
		%>
		<input type="text" id="address" name="address" required placeholder="Enter Your Address" onkeyup="return validateAddress()">
		<%}
		%>

					<label for="address">Address</label>
					<span id="address-error"></span> 
				</div>

				<div class="submit">
					<input type="submit" value="Update" id="submit">
				</div>
				<span id="submit-error"></span>
				<div class="login">
					<h4>
					
				<%String isthismenu = (String)session.getAttribute("isthismenu");
				  String isthiscart = (String)session.getAttribute("isthiscart");
				  String isthischeckout = (String)session.getAttribute("isthischeckout");
				  String isthisconfirm = (String)session.getAttribute("isthisconfirm");
				  String isthishistory = (String)session.getAttribute("isthishistory");
				  String isthisviewcart = (String)session.getAttribute("isthisviewcart");
				  
				  
				     if(isthismenu !=null&&isthismenu.equalsIgnoreCase("menu")){ 
					 %>
					 Change Your Mind?<a href="Menu.jsp">Go Back</a>
						
						<%
						}
						else if(isthiscart !=null&&isthiscart.equalsIgnoreCase("cart"))
						{
						%>
						Change Your Mind?<a href="Cart.jsp">Go Back</a>
						<%
						}
						else if(isthischeckout !=null&&isthischeckout.equalsIgnoreCase("checkout"))
						{
						%>
						Change Your Mind?<a href="CheckOut.jsp">Go Back</a>
						<%
						}
						else if(isthisconfirm !=null && isthisconfirm.equalsIgnoreCase("confirm"))
						{
						%>
						Change Your Mind?<a href="OrderConfirm.jsp">Go Back</a>
						<%
						}
						else if(isthishistory !=null&&isthishistory.equalsIgnoreCase("history"))
						{
						%>
						Change Your Mind?<a href="OrderHistory.jsp">Go Back</a>
						<%
						}
						else if(isthisviewcart !=null&& isthisviewcart.equalsIgnoreCase("viewcart"))
						{
						%>
						Change Your Mind?<a href="ViewCart.jsp">Go Back</a>
						<%
						}
						else
						{
						%>
						Change Your Mind?<a href="Restaurant.jsp">Go Back</a>
						<%
						}
						%>
					</h4>
				</div>
			</form>
		</div>
	</div>





	<!-- javascript -->

	<script>
		let eyeicon = document.getElementById("icon")
		let password = document.getElementById("password")

		function myfunction() {
			if (password.type == "password") {
				password.type = "text";
				eyeicon.src = "http://localhost:8080/tapfoods/Images/eye%20-open.png";
			} else {
				password.type = "password";
				eyeicon.src = "http://localhost:8080/tapfoods/Images/eye-close.png"
			}
		}
		
		
		
		 var nameError=document.getElementById('name-error')
         function validateName(){
                     var name=document.getElementById('name').value;
                     
                     
                      if(name.length==0)
                         {
                         nameError.innerHTML="<div class='en'>Enter Name</div>";
                         return false
                         
                         }
                        if(!name.match(/^[A-Za-z\s]*$/))
                         {
                             nameError.innerHTML="<div class='epn'>Enter proper Name</div";
                             return false;
                         }
                         if(name.length<3)
                         {
                             nameError.innerHTML="<div class='efn'>Enter Full Name</div>";
                             return false;
 
                         }
                        
                     
                     nameError.innerHTML='<div class="v">&#9989;</div>';
                     return true;
                     
                 }  
	
		 var userNameError=document.getElementById('username-error')
         function validateUserName(){
                     var userName=document.getElementById('userName').value;
                     
                     
                      if(userName.length==0)
                         {
                             userNameError.innerHTML="<div class='en'>Enter UserName</div>";
                         return false
                         
                         }
                     
                        if(!userName.match(/^[a-zA-z][a-zA-Z0-9_]*$/))
                         {
                             userNameError.innerHTML="<div class='epn'>Starts with Alphabet and Spaces and Special Characters are not allowed except ( _ ) </div";
                             return false;
                         }
                         if(userName.length<3)
                         {
                             userNameError.innerHTML="<div class='efn'>Enter more than 2 characters</div>";
                         return false
                         
                         }
                        
                     
                         userNameError.innerHTML='<div class="v">&#9989;</div>';
                     return true;
                     
                 }  
		
		 var emailError=document.getElementById('email-error')
         function validateEmail(){
                     var email=document.getElementById('email').value;
                     
                     
                      if(email.length==0)
                         {
                             emailError.innerHTML="<div class='en'>Enter Email</div>";
                         return false
                         
                         }
                        if(!email.match(/^[^\s@]+@[^\s@]+\.+[a-z]{3}$/))
                         {
                             emailError.innerHTML="<div class='epn'>Enter proper Email</div";
                             return false;
                         }
                        
                     
                         emailError.innerHTML='<div class="v">&#9989;</div>';
                     return true;
                     
                 } 
		 var phoneNoError=document.getElementById('phoneNo-error')
         function validatePhoneNo(){
                     var phoneNo=document.getElementById('phoneNo').value;
                     
                     
                      if(phoneNo.length==0)
                         {
                             phoneNoError.innerHTML="<div class='en'>Enter PhoneNo</div>";
                         return false
                         
                         }
                     
                        if(!phoneNo.match(/^[6-9][0-9]{9}$/))
                         {
                             phoneNoError.innerHTML="<div class='epn'>Enter 10 Digit Proper PhoneNo</div";
                             return false;
                         }
                        
                        
                     
                         phoneNoError.innerHTML='<div class="v">&#9989;</div>';
                     return true;
                     
                 }  
		 var addressError=document.getElementById('address-error')
         function validateAddress(){
                     var address=document.getElementById('address').value;
                     
                     
                      if(address.length==0)
                         {
                    	  addressError.innerHTML="<div class='en'>Enter Address</div>";
                         return false
                         
                         }
                        if(!address.match(/^[A-Za-z0-9\s-,]*$/))
                         {
                        	addressError.innerHTML="<div class='epn'>Enter proper Address</div";
                             return false;
                         }
                         if(address.length<3)
                         {
                        	 addressError.innerHTML="<div class='efn'>Enter Full Address</div>";
                             return false;
 
                         }
                        
                     
                         addressError.innerHTML='<div class="v">&#9989;</div>';
                     return true;
                     
                 }
		 var submitError=document.getElementById('submit-error'); 
		 function validateAll(){
	            var submit=document.getElementById('submit');  
	            if(!validateName() || !validateEmail()|| !validatePhoneNo()|| !validateUserName()||!validateAddress() )
	            {
	                submitError.innerHTML="<div class='submiterror'>Please Provide Correct Details</div>";
	               
	                return false;
	            }
	            return true;
	        }
		
	</script>


</body>
</html>