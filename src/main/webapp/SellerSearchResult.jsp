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
		  min-height: 100vh;
		  height: auto; 
/*  		  opacity: 0.5;  */
		  z-index:1;
		
		  background-position: center;
		  background-repeat: no-repeat;
		  background-size: cover;
	}
	
	#items{
		display:flex;
		flex-wrap:wrap;
 		justify-content:center; 
 		width:100%;
		height:auto;
		margin-top:1%;
		padding:4px;
		
	}
	
	#img1{
		height: 50%;
		width:10vw;
		margin:0 auto;
	}
	
	.h1_1 {
  position: relative;
  padding: 0;
  margin: 0;
  font-family: "Raleway", sans-serif;
  font-weight: 300;
  font-size: 40px;
  color: #080808;
  -webkit-transition: all 0.4s ease 0s;
  -o-transition: all 0.4s ease 0s;
  transition: all 0.4s ease 0s;
}

.h1_1 span {
  display: block;
  font-size: 0.5em;
  line-height: 1.3;
}
.h1_1 em {
  font-style: normal;
  font-weight: 600;
}

.seven .h1_1 {
  position:relative; font-size:20px; font-weight:700;  letter-spacing:0px; text-transform:uppercase; width:500px; 
  text-align:center; margin-left:30px; white-space:nowrap; border:2px solid #222;padding:5px 11px 3px 11px;
  border-width:thick;
}
.seven .h1_1:before, .seven .h1_1:after {
    background-color: #c50000;
    position:absolute; 
    content: '';
    height: 20px;

    width: 20px; border-radius:50%;
    bottom: 40px;
}
.seven .h1_1:before {
   left:-30px;
}
.seven .h1_1:after {
   right:-30px;
}
  
  </style>
  
</head>
<body>
	
	<%@ include file="./header/SellerHomeHeader.jsp" %>

	<div class="bg">
		
		<br>
		<br>
		<br>
		
		
	
		<div style="background-color:#CAEDFF; padding:22px;">
			<br>
			
			
			<div style="text-align:center;">
				<p style="font-size:16px font-family: Arial, Helvetica, sans-serif;">We specialize in Fruits, Vegetables, Dairy Products And various types of Food Oils</p>
			</div>
			
			
			<div style="text-align:center;">
				<form action="SellerSearchResult.jsp?search=<%= request.getParameter("searchValue") %>" method="get">
					<input name="searchValue" type="text" placeholder="Search" aria-label="Search" style="width:25%; height:40px;" required>					
					<button type="submit" class="btn btn-outline-success">Search</button>					
				</form>
			</div>
			
		</div>
		
	    
	    
	    	
	    <%@ page import="java.io.IOException" %>
	    <%@ page import="java.sql.Connection" %>
	    <%@ page import ="java.sql.DriverManager" %>
	    <%@ page import ="jakarta.servlet.ServletException" %>
	    <%@ page import ="jakarta.servlet.http.HttpServlet" %>
	    <%@ page import ="jakarta.servlet.http.HttpServletRequest" %>
	    <%@ page import ="jakarta.servlet.http.HttpServletResponse" %>
	    <%@ page import ="java.sql.PreparedStatement" %>
	    <%@ page import ="java.sql.ResultSet" %>
	    <%@ page import ="jakarta.servlet.RequestDispatcher" %>
	    
	    <%!
			String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String user = "demo";
			String password = "password";
			String search = "";
			int a = 0;
			int b = 0;
			int c = 0;
			int d = 0;
			int e = 0;
	    %>
	    
	    <%
	    	
		    try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			try(Connection con = DriverManager.getConnection(url,user,password)) {
				
				search = request.getParameter("searchValue");
			
				String query1 = "select * from REPOSITORY where ProductName LIKE '%"+search+"%' AND SellerUsername=? AND ProductCategory=?";
				
				String username = (String) session.getAttribute("username");
				PreparedStatement st1 = con.prepareStatement(query1);
				st1.setString(1,username);
				st1.setString(2,"Fruits");
				
				ResultSet rs1 = st1.executeQuery();
		%>				
			<div class="seven">				
			<h1 style="font-weight:1000;font-size:50px;padding:20px;color:lightBlue;text-decoration:underline ;" class="h1_1" id="fruits">FRUITS</h1><br><br>
			</div>
			<div id="items">
		<%		
				a=0;
				while(rs1.next()){
					a=1;
		%>
		
				<div style="margin:0 1vw;" class="card w-25 text-bg-light mb-3 border-secondary " style="width: 18rem;">
				  <img id="img1" src="<%= rs1.getString("ProductImage") %>" class="card-img-top" alt="Product Image">
				  <div class="card-body ">
				    <h5 class="card-title"><%= rs1.getString("ProductName") %></h5>
				    <p class="card-text"><%= rs1.getString("ProductDescription") %></p>
				  </div>
				  <ul class="list-group list-group-flush">
				    <li class="list-group-item">PRICE : <b><%= rs1.getDouble("ProductPrice") %></b></li>
				    <li class="list-group-item">CATEGORY : <b><%= rs1.getString("ProductCategory") %></b></li>
				    <li class="list-group-item">QUANTITY LEFT : <b><%= rs1.getInt("ProductQuantity") %></b> </li>
				  </ul>
				  <div class="card-body">
				  <a href="./UpdateSellerRepository.jsp?imagePath=<%= rs1.getString("ProductImage") %>&name=<%= rs1.getString("ProductName") %>&description=<%= rs1.getString("ProductDescription") %>&price=<%= rs1.getString("ProductPrice") %>&category=<%= rs1.getString("ProductCategory")%>&quantity=<%= rs1.getString("ProductQuantity") %>" class="card-link">Update Product </a>
				    <a href="SellerDeleteRepository?imagePath=<%= rs1.getString("ProductImage") %>&name=<%= rs1.getString("ProductName") %>&description=<%= rs1.getString("ProductDescription") %>&price=<%= rs1.getString("ProductPrice") %>&category=<%= rs1.getString("ProductCategory")%>&quantity=<%= rs1.getString("ProductQuantity") %>" class="card-link">Delete Product</a>
				  </div>	  
	       		</div>
			
		<%
			}
			if(a==0){
				
		%>
				
			<h1 style="text-align:center;">NOTHING AVAILABLE</h1>
		<%
		}
// 			String username = (String) session.getAttribute("username");
			PreparedStatement st2 = con.prepareStatement(query1);
			st2.setString(1,username);
			st2.setString(2,"Vegetables");
			
			ResultSet rs2 = st2.executeQuery();
			
		%>
	       	</div>
			<div class="seven">				
			<h1 style="font-weight:1000;font-size:50px;padding:20px;color:lightBlue;text-decoration:underline ;" class="h1_1" id="fruits">VEGETABLES</h1><br><br>
			</div>
			<div id="items">
		<%
			b=0;
			while(rs2.next()){
				b=1;
		%>
		
				<div style="margin:0 1vw;" class="card w-25 text-bg-light mb-3 border-secondary " style="width: 18rem;">
				  <img id="img1" src="<%= rs2.getString("ProductImage") %>" class="card-img-top" alt="Product Image">
				  <div class="card-body ">
				    <h5 class="card-title"><%= rs2.getString("ProductName") %></h5>
				    <p class="card-text"><%= rs2.getString("ProductDescription") %></p>
				  </div>
				  <ul class="list-group list-group-flush">
				    <li class="list-group-item">PRICE : <b><%= rs2.getDouble("ProductPrice") %></b></li>
				    <li class="list-group-item">CATEGORY : <b><%= rs2.getString("ProductCategory") %></b></li>
				    <li class="list-group-item">QUANTITY LEFT : <b><%= rs2.getInt("ProductQuantity") %></b> </li>
				  </ul>
				  <div class="card-body">
				  <a href="./UpdateSellerRepository.jsp?imagePath=<%= rs2.getString("ProductImage") %>&name=<%= rs2.getString("ProductName") %>&description=<%= rs2.getString("ProductDescription") %>&price=<%= rs2.getString("ProductPrice") %>&category=<%= rs2.getString("ProductCategory")%>&quantity=<%= rs2.getString("ProductQuantity") %>" class="card-link">Update Product </a>
				    <a href="SellerDeleteRepository?imagePath=<%= rs2.getString("ProductImage") %>&name=<%= rs2.getString("ProductName") %>&description=<%= rs2.getString("ProductDescription") %>&price=<%= rs2.getString("ProductPrice") %>&category=<%= rs2.getString("ProductCategory")%>&quantity=<%= rs2.getString("ProductQuantity") %>" class="card-link">Delete Product</a>
				  </div>	  
	       		</div>
			
		<%
			}
			if(b==0){
				
				%>
						
					<h1 style="text-align:center;">NOTHING AVAILABLE</h1>
				<%
				}
// 			String username = (String) session.getAttribute("username");
			PreparedStatement st3 = con.prepareStatement(query1);
			st3.setString(1,username);
			st3.setString(2,"Oils");
			
			ResultSet rs3 = st3.executeQuery();
		%>
	       	</div>
			<div class="seven">				
			<h1 style="font-weight:1000;font-size:50px;padding:20px;color:lightBlue;text-decoration:underline ;" class="h1_1" id="fruits">OILS</h1><br><br>
			</div>
			<div id="items">
		<%
			c=0;
			while(rs3.next()){
				c=1;
		%>
				<div style="margin:0 1vw;" class="card w-25 text-bg-light mb-3 border-secondary " style="width: 18rem;">
				  <img id="img1" src="<%= rs3.getString("ProductImage") %>" class="card-img-top" alt="Product Image">
				  <div class="card-body ">
				    <h5 class="card-title"><%= rs3.getString("ProductName") %></h5>
				    <p class="card-text"><%= rs3.getString("ProductDescription") %></p>
				  </div>
				  <ul class="list-group list-group-flush">
				    <li class="list-group-item">PRICE : <b><%= rs3.getDouble("ProductPrice") %></b></li>
				    <li class="list-group-item">CATEGORY : <b><%= rs3.getString("ProductCategory") %></b></li>
				    <li class="list-group-item">QUANTITY LEFT : <b><%= rs3.getInt("ProductQuantity") %></b> </li>
				  </ul>
				  <div class="card-body">
				  <a href="./UpdateSellerRepository.jsp?imagePath=<%= rs3.getString("ProductImage") %>&name=<%= rs3.getString("ProductName") %>&description=<%= rs3.getString("ProductDescription") %>&price=<%= rs3.getString("ProductPrice") %>&category=<%= rs3.getString("ProductCategory")%>&quantity=<%= rs3.getString("ProductQuantity") %>" class="card-link">Update Product </a>
				    <a href="SellerDeleteRepository?imagePath=<%= rs3.getString("ProductImage") %>&name=<%= rs3.getString("ProductName") %>&description=<%= rs3.getString("ProductDescription") %>&price=<%= rs3.getString("ProductPrice") %>&category=<%= rs3.getString("ProductCategory")%>&quantity=<%= rs3.getString("ProductQuantity") %>" class="card-link">Delete Product</a>
				  </div>	  
	       		</div>
			
		<%
			}
			if(c==0){
				
				%>
						
					<h1 style="text-align:center;">NOTHING AVAILABLE</h1>
				<%
				}
// 			String username = (String) session.getAttribute("username");
			PreparedStatement st4 = con.prepareStatement(query1);
			st4.setString(1,username);
			st4.setString(2,"Dairy");
			
			ResultSet rs4 = st4.executeQuery();
			
		%>
	       	</div>
			<div class="seven">				
			<h1 style="font-weight:1000;font-size:50px;padding:20px;color:lightBlue;text-decoration:underline ;" class="h1_1" id="fruits">DAIRY</h1><br><br>
			</div>
			<div id="items">
		<%
			d=0;
			while(rs4.next()){
			d=1;
		%>
		
				<div style="margin:0 1vw;" class="card w-25 text-bg-light mb-3 border-secondary " style="width: 18rem;">
				  <img id="img1" src="<%= rs4.getString("ProductImage") %>" class="card-img-top" alt="Product Image">
				  <div class="card-body ">
				    <h5 class="card-title"><%= rs4.getString("ProductName") %></h5>
				    <p class="card-text"><%= rs4.getString("ProductDescription") %></p>
				  </div>
				  <ul class="list-group list-group-flush">
				    <li class="list-group-item">PRICE : <b><%= rs4.getDouble("ProductPrice") %></b></li>
				    <li class="list-group-item">CATEGORY : <b><%= rs4.getString("ProductCategory") %></b></li>
				    <li class="list-group-item">QUANTITY LEFT : <b><%= rs4.getInt("ProductQuantity") %></b> </li>
				  </ul>
				  <div class="card-body">
				  <a href="./UpdateSellerRepository.jsp?imagePath=<%= rs4.getString("ProductImage") %>&name=<%= rs4.getString("ProductName") %>&description=<%= rs4.getString("ProductDescription") %>&price=<%= rs4.getString("ProductPrice") %>&category=<%= rs4.getString("ProductCategory")%>&quantity=<%= rs4.getString("ProductQuantity") %>" class="card-link">Update Product </a>
				    <a href="SellerDeleteRepository?imagePath=<%= rs4.getString("ProductImage") %>&name=<%= rs4.getString("ProductName") %>&description=<%= rs4.getString("ProductDescription") %>&price=<%= rs4.getString("ProductPrice") %>&category=<%= rs4.getString("ProductCategory")%>&quantity=<%= rs4.getString("ProductQuantity") %>" class="card-link">Delete Product</a>
				  </div>	  
	       		</div>
			
		<%
			}
			if(d==0){
				
				%>
						
					<h1 style="text-align:center;">NOTHING AVAILABLE</h1>
				<%
				}
//			String username = (String) session.getAttribute("username");
			PreparedStatement st5 = con.prepareStatement(query1);
			st5.setString(1,username);
			st5.setString(2,"Others");
		
			ResultSet rs5 = st5.executeQuery();
		
		%>
	       	</div>
		
			<div class="seven">				
			<h1 style="font-weight:1000;font-size:50px;padding:20px;color:lightBlue;text-decoration:underline ;" class="h1_1" id="fruits">OTHERS</h1><br><br>
			</div>
			<div id="items">
		<%
			e=0;
			while(rs5.next()){
			e=1;
		%>
		
				<div style="margin:0 1vw;" class="card w-25 text-bg-light mb-3 border-secondary " style="width: 18rem;">
				  <img id="img1" src="<%= rs5.getString("ProductImage") %>" class="card-img-top" alt="Product Image">
				  <div class="card-body ">
				    <h5 class="card-title"><%= rs5.getString("ProductName") %></h5>
				    <p class="card-text"><%= rs5.getString("ProductDescription") %></p>
				  </div>
				  <ul class="list-group list-group-flush">
				    <li class="list-group-item">PRICE : <b><%= rs5.getDouble("ProductPrice") %></b></li>
				    <li class="list-group-item">CATEGORY : <b><%= rs5.getString("ProductCategory") %></b></li>
				    <li class="list-group-item">QUANTITY LEFT : <b><%= rs5.getInt("ProductQuantity") %></b> </li>
				  </ul>
				  <div class="card-body">
				  <a href="./UpdateSellerRepository.jsp?imagePath=<%= rs5.getString("ProductImage") %>&name=<%= rs5.getString("ProductName") %>&description=<%= rs5.getString("ProductDescription") %>&price=<%= rs5.getString("ProductPrice") %>&category=<%= rs5.getString("ProductCategory")%>&quantity=<%= rs5.getString("ProductQuantity") %>" class="card-link">Update Product </a>
				    <a href="SellerDeleteRepository?imagePath=<%= rs5.getString("ProductImage") %>&name=<%= rs5.getString("ProductName") %>&description=<%= rs5.getString("ProductDescription") %>&price=<%= rs5.getString("ProductPrice") %>&category=<%= rs5.getString("ProductCategory")%>&quantity=<%= rs5.getString("ProductQuantity") %>" class="card-link">Delete Product</a>
				  </div>	  
	       		</div>
			
		<%
			}
			if(e==0){
				
				%>
						
					<h1 style="text-align:center;">NOTHING AVAILABLE</h1>
				<%
				}
		%>
	       	</div>
		
		<%
				
			}catch(Exception e){
				RequestDispatcher rd = request.getRequestDispatcher("serverError.html");
				rd.forward(request, response);
				e.printStackTrace();
			}
	    
	    %>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a0b4a376bd.js" crossorigin="anonymous"></script>

	<%@ include file="footer.jsp" %>

</body>
</html>