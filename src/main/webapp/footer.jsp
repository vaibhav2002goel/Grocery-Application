<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <title>Grocers Mart</title>	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


</head>
<body>
		    <br><br>

	 <%@ page import="java.util.*" %>
	<nav class="navbar navbar-expand-lg fixed-bottom" style="background-color: #e3f2fd;">
  		<div class="container-fluid">
  			
    		
  			<i class="fa-solid fa-user"></i>
  			&nbsp;&nbsp;&nbsp;
    		<span class="navbar-brand mb-0 h1"> Welcome <%=  session.getAttribute("username") %> </span>
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <div class="collapse navbar-collapse" id="navbarText">
			    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			      <li class="nav-item">
			      </li>
			      <li class="nav-item">
			      </li>
			     	
			     	
			     
			    </ul>
		        
		    </div>
    		<b><%= (new java.util.Date()).toLocaleString()%></b>
  		</div>
	</nav>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	
		<script src="https://kit.fontawesome.com/a0b4a376bd.js" crossorigin="anonymous"></script>

</body>
</html>