<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
  <title>Grocers Mart</title>
<link rel="stylesheet" href="./css/SignUpCSS.css">

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
</style>

</head>
<body>
	

	<%@ include file="./header/SellerSignUpHeader.html" %>
	<div class="bg">
	
	<div class="signupFrm">
    <form action="sellerValidationAndInsertion" method="post" class="form">
      <h1 class="title">Sign up</h1>

      <div class="inputContainer">
        <input name="email" id="email" type="email" class="input" placeholder="a" required>
        <label for="email" class="label">Email</label>
      </div>

      <div class="inputContainer">
        <input name="username" id="username" type="text" class="input" placeholder="a" required>
        <label for="username" class="label">Username</label>
      </div>
      
      <div class="inputContainer">
        <input name="company" id="company" type="text" class="input" placeholder="a" required>
        <label for="company" class="label">Company</label>
      </div>

      <div class="inputContainer">
        <input name="password" id="password" type="password" class="input" placeholder="a" required>
        <label for="password" class="label">Password</label>
      </div>

      <div class="inputContainer">
        <input name="confirm_password" id="confirm_password" type="password" class="input" placeholder="a" required>
        <label for="confirm_password" class="label">Confirm Password</label>
      </div>

      <input id="submit_btn" type="submit" class="submitBtn" value="Sign up">
    </form>
  </div>
  
  	</div>
  
<!--   <script type="text/javascript" src="./javascript/sellerValidation.js"></script> -->
  
  <script>
  let email = document.getElementById('email');
  let username = document.getElementById('username');
  let password = document.getElementById('password');
  let confirm_password = document.getElementById('confirm_password');
  let submit_btn = document.getElementById('submit_btn');

  submit_btn.addEventListener('click',function(e){
  	
  	
  	let flag = 1;
    	console.log(username.length);
    	for(let i=0;i<username.value.length;i++){
    		console.log(username.value.charCodeAt(i));
    		if(username.value.charCodeAt(i)==32){
    			flag=0;
    			break;
    		}
    	}
    	if(!flag){
    		alert("Cannot give spaces in username");
    		submit_btn.setAttribute('type','button')
    		return;
    	}
  	
  	for(let i=0;i<username.length;i++){
  		if(username.charCodeAt(i)==""){
  			flag=0;
  			break;
  		}
  	}
  	if(!flag){
  		alert("Cannot give spaces in username");
  		submit_btn.setAttribute('type','button')
  	}
  	if( (password.value != confirm_password.value)){
  		alert("Password don't Match");
  		submit_btn.setAttribute('type','button')
  	}
  	else{
  		submit_btn.setAttribute('type','submit')
  	}
  })

  
  
  </script>

</body>
</html>