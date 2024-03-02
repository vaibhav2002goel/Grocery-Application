<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
        #h11 {
          color: #88B04B;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        #p1 {
          color: #404F5E;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-size:20px;
          margin: 0;
        }
      #i1 {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .card1 {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
	</style>
	
		<%@ include file="./header/BuyerHomeHeader.jsp" %>
	
<body>

	<div class="bg" style="text-align:center">
	<br><br><br><br><br><br><br>
		<div class="card1" >
	      <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;text-align:center;">
	        <i id="i1" class="checkmark">✓</i>
	      </div>
	      <div>
	        <h1 id="h11">Success</h1> 
	        <p id="p1">We received your purchase request;<br/> we'll be in touch shortly!</p>
	      </div>
	 
		</div>
	</div>
	<%@ include file="footer.jsp" %>

</body>
</html>