<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <title>Grocers Mart</title>
  
    <style>
  
  	.bg {
		  background-image: url("./images/background1.jpg");
		
		  height: 100vh; 
/*  		  opacity: 0.5;  */
		  z-index:1;
		
		  background-position: center;
		  background-repeat: no-repeat;
		  background-size: cover;
	}
	


* {
    margin: 0;
}


.main {
    margin-top: 5%;
    margin-left: 25%;
    font-size: 28px;
    padding: 0 10px;
    width: 58%;
}

.main h1 {
    color: black;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 24px;
    margin-bottom: 10px;
}

.main .card {
    background-color: #fff;
    border-radius: 18px;
    box-shadow: 1px 1px 8px 0 grey;
    height: auto;
    margin-bottom: 20px;
    padding: 20px 0 20px 50px;
}

.main .card table {
    border: none;
    font-size: 16px;
    height: 270px;
    width: 80%;
}

 
  </style>
  
</head>
<body>
	
	<%@ include file="./header/SellerHomeHeader.jsp" %>

	<div class="bg">
	
	<br>
	<br>
	<br>
		<div class="main">
        <div class="card">
            <div class="card-body">
        		<h1 style="text-decoration:underline; font-family:sans-serif;">PROFILE INFORMATION</h1>
                <table>
                    <tbody>
                        <tr>
                            <th style="font-size:25px;">Username</th>
                            <td style="font-size:25px;">:</td>
                            <td style="font-size:25px;"><%= (String) session.getAttribute("username") %></td>
                        </tr>
                        <tr>
                            <th style="font-size:25px;">Password</th>
                            <td style="font-size:25px;">:</td>
                            <td style="font-size:25px;"><%= (String) session.getAttribute("password") %></td>
                        </tr>
                        <tr>
                            <th style="font-size:25px;">Email</th>
                            <td style="font-size:25px;">:</td>
                            <td style="font-size:25px;"><%= (String) session.getAttribute("email") %></td>
                        </tr>
                        <tr>
                            <th style="font-size:25px;">Address</th>
                            <td style="font-size:25px;">:</td>
                            <td style="font-size:25px;"><%= (String) session.getAttribute("company") %></td>
                        </tr>

                    </tbody>
                </table>
            </div>
            	  <div class="card-body">
	            	<h1 style="text-decoration:underline; font-family:sans-serif;display:inline-block;">FOR UPDATING INFORMATION FILL THE FOLLOWING FORM</h1>
	            	<i class="fa fa-pen fa-xs edit"></i>
	            	<form action="UpdateSellerAndVerification" method="post">
		                <table>
		                    <tbody>
		                        <tr>
									<th style="font-size:25px;"><label for="password">New Password</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><input type="password" name="password" id="password" required ></td>
		                        </tr>
		                         <tr>
									<th style="font-size:25px;"><label for="confirm_password">New Confirmed Password</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><input type="password" name="confirm_password" id="confirm_password" required ></td>
		                        </tr>
		                        <tr>
									<th style="font-size:25px;"><label for="email">New Email</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><input type="email" name="email" id="email" required ></td>
		                        </tr>
		                        <tr>
									<th style="font-size:25px;"><label for="company">New Company Name</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><input type="text" name="company" id="company" required ></td>
		                        </tr>
		                        
		                        <input type="hidden" name="old-username" value=<%= (String) session.getAttribute("username") %>>
		
		                    </tbody>
		                </table>
		                <input style="margin-top:1%;" type="Submit" value="Update" id="submit_btn">
               			
           			</form>				
           		</div>
        </div>
        
         
		</div>
	</div>
	
	<script>
	
	let email = document.getElementById('email');
	let username = document.getElementById('username');
	let password = document.getElementById('password');
	let confirm_password = document.getElementById('confirm_password');
	let submit_btn = document.getElementById('submit_btn');

	submit_btn.addEventListener('click',function(e){
		if(password.value != confirm_password.value){
			alert("Password don't Match");
			submit_btn.setAttribute('type','button')
		}
		else{
			submit_btn.setAttribute('type','submit')
		}
	})

	
	</script>
	<%@ include file="footer.jsp" %>

	
</body>
</html>