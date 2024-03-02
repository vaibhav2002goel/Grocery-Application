<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

  <title>Grocers Mart</title>
  
    <style>
  
  	.bg {
		  background-image: url("./images/background1.jpg");
		
		min-height:100vh;
		  height: auto; 
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
	        		<h1 style="text-decoration:underline; font-family:sans-serif;">PRODUCT DELETED SUCCESSFULLY</h1>
	                <table>
	                    <tbody>
	                        <tr>
	                            <th style="font-size:25px;">Image Path</th>
	                            <td style="font-size:25px;">:</td>
	                            <td style="font-size:25px;"><%= request.getParameter("imagePath") %></td>
	                        </tr>
	                        <tr>
	                            <th style="font-size:25px;">Product Name</th>
	                            <td style="font-size:25px;">:</td>
	                            <td style="font-size:25px;"><%= request.getParameter("name") %></td>
	                        </tr>
	                        <tr>
	                            <th style="font-size:25px;">Description</th>
	                            <td style="font-size:25px;">:</td>
	                            <td style="font-size:25px;"><%= request.getParameter("description") %></td>
	                        </tr>
	                        <tr>
	                            <th style="font-size:25px;">Price</th>
	                            <td style="font-size:25px;">:</td>
	                            <td style="font-size:25px;"><%= request.getParameter("price") %></td>
	                        </tr>
	                        <tr>
	                            <th style="font-size:25px;">Category</th>
	                            <td style="font-size:25px;">:</td>
	                            <td style="font-size:25px;"><%= request.getParameter("category") %></td>
	                        </tr>
	                        <tr>
	                            <th style="font-size:25px;">Quantity</th>
	                            <td style="font-size:25px;">:</td>
	                            <td style="font-size:25px;"><%= request.getParameter("quantity") %></td>
	                        </tr>
	
	                    </tbody>
	                </table>
            	</div>
            </div>
       	</div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>