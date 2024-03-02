<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
  <title>Grocers Mart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 
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
	
	.myButton1 {
	    display: block;
	    width: 115px;
	    height: 25px;
	    background: #4E9CAF;
	    padding: -2px;
	    text-align: center;
	    border-radius: 5px;
	    color: white;
	    font-weight: bold;
	    line-height: 25px;
	}
	
	.myButton2 {
	    display: block;
	    width: 200px;
	    height: 30px;
	    background: #4E9CAF;
	    padding: -4px;
	    text-align: center;
	    border-radius: 5px;
	    color: white;
	    font-weight: bold;
	    line-height: 25px;
	}
	
	
  
  </style>
  
</head>
	
<body>

	<%@ include file="./header/BuyerHomeHeader.jsp" %>
	<div class="bg">
	<br><br><br><br><br><br><br><br><br><br><br><br>
		
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
			double price;
			double amount;
			double totalAmount;
			int quantity;
	    %>
	    
	    
	    
		<table class="table table-striped" style="width:80%; margin:auto; ">
			  <thead >
			    <tr class="table-success">
			      <th scope="col">Serial No.</th>
			      <th scope="col">Product</th>
			      <th scope="col">Price</th>
			      <th scope="col">Quantity</th>
			      <th scope="col">Delete Product  </th>
			      <th scope="col">Amount</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  
			  
	    <%
		    try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				System.out.println("In jdbc dricer error");
				e.printStackTrace();
			}
			try(Connection con = DriverManager.getConnection(url,user,password)) {
			
		    		String username = (String) session.getAttribute("username");
					String query1 = "select * from CART where BuyerUsername=?";
					
					PreparedStatement st1 = con.prepareStatement(query1);
					st1.setString(1,username);
					
					ResultSet rs1 = st1.executeQuery();
					
					int i = 1;
					totalAmount = 0;
					while(rs1.next()){
						quantity = rs1.getInt("ProductQuantity");
						
						
		%>	
					    <tr>
					      <th scope="row"> <%= i %> </th>
					      <td><%= rs1.getString("ProductName") %></td>
					      <td><%= rs1.getString("ProductPrice") %></td>
					      <td> 
						      <form action="BuyerUpdateCartQuantity?name=<%= rs1.getString("ProductName") %>&category=<%= rs1.getString("ProductCategory") %>&username=<%= (String) session.getAttribute("username") %>" method="post"%>				      	
						      <input type="number" name="productQuantity" value =<%= quantity %>>
						      	<input type="submit" value="Update"> 
						      </form>  
					      </td>
					      <td> <a href="DeleteProduct?name=<%= rs1.getString("ProductName") %>&category=<%= rs1.getString("ProductCategory") %>&username=<%= (String) session.getAttribute("username") %>" class="myButton1" > Delete </a></td>
					      
					      <%
					      	price = Double.parseDouble(rs1.getString("ProductPrice"));
						   	amount = price * quantity;
					      %>
					      
					      <td><%= amount %></td>
					    </tr>
		    
		   			<% 
		   				 
						totalAmount += amount;
			   			
			   			i++;  
		   			
					
					} %>
		    
		  </tbody>
		    <thead >
		    <tr class="table-success">
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td colspan="2"><b>Total Amount to be Paid </b>   &nbsp; &nbsp; &nbsp; &nbsp;  <b> :  &nbsp; &nbsp; &nbsp; &nbsp;<%= totalAmount %>  </b></td>
		    </tr>
		  </thead>
		  <thead >
		    <tr class="table-success">
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td colspan="1"><b><a href="BuyerCheckProductQuantity?username=<%= (String) session.getAttribute("username")%>" class="myButton2">Continue to payment</a></td>
		    </tr>
		  </thead>
		<%
			}
			catch(Exception e){ 
				RequestDispatcher rd = request.getRequestDispatcher("serverError.html");
				rd.forward(request, response);
				e.printStackTrace();
			}
		%>			
		</table>
	</div>
	
		<%@ include file="footer.jsp" %>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>