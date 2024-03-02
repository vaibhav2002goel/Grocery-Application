<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<%@ include file="./header/SellerHomeHeader.jsp" %>

</head>
<body>
	<div class="bg">
	<br><br><br>
		<div class="main">
        <div class="card">
        
        <div class="card-body">
	            	<h1 style="text-decoration:underline; font-family:sans-serif;display:inline-block;">FOR UPDATING INFORMATION FILL THE FOLLOWING FORM</h1>
	            	<i class="fa fa-pen fa-xs edit"></i>
	            	<form action="BuyerTransaction" method="post">
		                <table>
		                    <tbody>
		                        <tr>
									<th style="font-size:25px;"><label for="startDate">Start Date</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><input type="date" name="startDate" id="startDate" ></td>
		                        </tr>
		                         <tr>
									<th style="font-size:25px;"><label for="endDate">End Date</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><input type="date" name="endDate" id="endDate" ></td>
		                        </tr>
		                        <tr>
									<th style="font-size:25px;"><label for="user">Select User</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;">
		                            
		                            
		                            <select name="user" id="user">
		                            
		                            <option value="Choose User"> Choose User </option>
		                            
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
								    %>
								    
								    <%
									    try {
											Class.forName("com.mysql.cj.jdbc.Driver");
										} catch (ClassNotFoundException e) {
											System.out.println("In jdbc dricer error");
											e.printStackTrace();
										}
										try(Connection con = DriverManager.getConnection(url,user,password)) {
																			 
												String query1 = "select * from CART ";
												
												PreparedStatement st1 = con.prepareStatement(query1);
												
												HashMap<String,Integer> map = new HashMap<>();
												
												ResultSet rs1 = st1.executeQuery();
												
												while(rs1.next()){
													
													if(!map.containsKey(rs1.getString("BuyerUsername"))){
													
									%>	
													<option value=<%= rs1.getString("BuyerUsername") %> ><%= rs1.getString("BuyerUsername") %></option>
													
													
													<%
													map.put(rs1.getString("BuyerUsername"),1);
													}%>
									
									
									<%}
										}catch(Exception e){ 
													RequestDispatcher rd = request.getRequestDispatcher("serverError.html");
													rd.forward(request, response);
													e.printStackTrace();
												}
									
									
									
									%>
		                            
		                            </select>
		                            
		                            </td>
		                           
		                        </tr>
		                        
		                        <input type="hidden" name="old-username" value=<%= (String) session.getAttribute("username") %>>
		
		                    </tbody>
		                </table>
		                <input style="margin-top:1%;" type="Submit" value="Submit" id="submit_btn">
               			
           			</form>				
           		</div>
	</div>
	</div>
	</div>
	


<%@ include file="footer.jsp" %>

</body>
</html>