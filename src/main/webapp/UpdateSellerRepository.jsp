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
        		<h1 style="text-decoration:underline; font-family:sans-serif;">PRODUCT INFORMATION</h1>
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
        	
                    <div class="card-body">
	            	<h1 style="text-decoration:underline; font-family:sans-serif;display:inline-block;">FOR UPDATING PRODUCTS IN THE REPOSITORY FILL THE FOLLOWING FORM</h1>
	            	<i class="fa fa-pen fa-xs edit"></i>
	            	<form action="UpdateProduct" method="post">
		                <table>
		                    <tbody>
		                       
		                         <tr>
		                            <th style="font-size:25px;"><label for="image">New Image Path</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><textarea type="text" name="image" id="image" placeholder="Enter complete image path " required ></textarea></td>
		                        </tr>
		                         <tr>
									<th style="font-size:25px;"><label for="description">New Product Description</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;">
		                            <textarea rows="4" cols="20" name="description" placeholder="Maximum 200 characters"></textarea>
		                            </td>
		                        </tr>
		                        <tr>
									<th style="font-size:25px;"><label for="price">New Product Price</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><input type="number" name="price" id="price" required ></td>
		                        </tr>
		                        <tr>
									<th style="font-size:25px;"><label for="quantity">New Product Quantity</label></th>
		                            <td style="font-size:25px;">:</td>
		                            <td style="font-size:25px;"><input type="number" name="quantity" id="quantity" required ></td>
		                        </tr>
		                        
		                        
		                        
		
		                    </tbody>
		                </table>
		                <input style="margin-top:1%;" type="Submit" value="Update Product" id="submit_btn">
		                        <input type="hidden" name="oldName" value="<%= request.getParameter("name") %>">
		                        <input type="hidden" name="oldCategory" value=<%= request.getParameter("category") %>>
		                       	<input type="hidden" name="username" value=<%= (String) session.getAttribute("username") %>>
               			
           			</form>				
           		</div>
        </div>
        
         
		</div>
	
	</div>
	
	<script>
		const input = document.getElementById('imageDisplay');
		const preview = document.getElementById('preview');
		
		input.addEventListener('change',()=>{
			const reader = new FileReader();
			reader.onload = ()=>{
				preview.src = reader.result;
			}
			reader.readAsDataURL(input.files[0]);
		})
		
	</script>
<%@ include file="footer.jsp" %>
</body>
</html>