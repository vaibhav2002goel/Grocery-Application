<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
  <title>Grocers Mart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 <link rel="Stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
  <style>
  
  	.bg {
		  background-image: url("./images/background1.jpg");
		
		  height: 100vh; 
/*  		  opacity: 0.5;  */
		  z-index:1;
		
		  background-position: center;
		  background-repeat: no-repeat;
		  background-size: cover;
		  
		  
	body {
  height: 100vh;
  justify-content: center;
  align-items: center;
  display: flex;
  background-color: #eee;
}

.launch {
  height: 50px;
}

.close {
  font-size: 21px;
  cursor: pointer;
}

.modal-body {
  height: 450px;
}

.nav-tabs {
  border: none !important;
}

.nav-tabs .nav-link.active {
  color: #495057;
  background-color: #fff;
  border-color: #ffffff #ffffff #fff;
  border-top: 3px solid blue !important;
}

.nav-tabs .nav-link {
  margin-bottom: -1px;
  border: 1px solid transparent;
  border-top-left-radius: 0rem;
  border-top-right-radius: 0rem;
  border-top: 3px solid #eee;
  font-size: 20px;
}

.nav-tabs .nav-link:hover {
  border-color: #e9ecef #ffffff #ffffff;
}

.nav-tabs {
  display: table !important;
  width: 100%;
}

.nav-item {
  display: table-cell;
}

.form-control {
  border-bottom: 1px solid #eee !important;
  border: none;
  font-weight: 600;
}

.form-control:focus {
  color: #495057;
  background-color: #fff;
  border-color: #8bbafe;
  outline: 0;
  box-shadow: none;
}

.inputbox {
  position: relative;
  margin-bottom: 20px;
  width: 100%;
}

.inputbox span {
  position: absolute;
  top: 7px;
  left: 11px;
  transition: 0.5s;
}

.inputbox i {
  position: absolute;
  top: 13px;
  right: 8px;
  transition: 0.5s;
  color: #3F51B5;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.inputbox input:focus ~ span {
  transform: translateX(-0px) translateY(-15px);
  font-size: 12px;
}

.inputbox input:valid ~ span {
  transform: translateX(-0px) translateY(-15px);
  font-size: 12px;
}

.pay button {
  height: 47px;
  border-radius: 37px;
}
		  
	
	#h1_1 {
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

#h1_1 span {
  display: block;
  font-size: 0.5em;
  line-height: 1.3;
}
#h1_1 em {
  font-style: normal;
  font-weight: 600;
}

.twelve #h1_1 {
  font-size:26px; font-weight:700;  letter-spacing:1px; text-transform:uppercase; width:160px; text-align:center; margin:auto; white-space:nowrap; padding-bottom:13px;
}
.twelve #h1_1:before {
    background-color: #c50000;
    content: '';
    display: block;
    height: 3px;
    width: 300px;
    margin-bottom: 5px;
}
.twelve #h1_1:after {
    background-color: #c50000;
    content: '';
    display: block;
  position:absolute; right:50; bottom:0;
    height: 3px;
    width: 300px;
    margin-bottom: 0.25em;
    
}	  
	
		  
	</style>
</head>
<body>

	<%@ include file="./header/BuyerHomeHeader.jsp" %>

	<div class="bg">
	<br><br><br><br><br>
		<div class="twelve" >
			<h1 id="h1_1" style="padding-top:250px; font-size:50px; margin-left:650px;" ><b>SELECT PAYMENT METHOD</b></h1>
		</div>
		
		<button style="margin-left:900px;margin-top:50px;height:80px;width:240px; font-size:2em;" type="button" class="btn btn-primary launch" data-toggle="modal" data-target="#staticBackdrop"> <i class="fa fa-rocket"></i> Pay Now </button>

<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <div class="text-right">
          <i class="fa fa-close close" data-dismiss="modal"></i>
        </div>

        <div class="tabs mt-3">
          <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="visa-tab" data-toggle="tab" href="#visa" role="tab" aria-controls="visa" aria-selected="true">
                <img src="https://i.imgur.com/sB4jftM.png" width="80">
              </a>
            </li>
           
            
            <li class="nav-item" role="presentation">
              <a class="nav-link" id "paypal-tab" data-toggle="tab" href="#paypal" role="tab" aria-controls="paypal" aria-selected="false">
                <img src="https://cdn-icons-png.flaticon.com/512/6491/6491511.png?ga=GA1.1.2012240897.1697110577" width="80" height="50">
              </a>
            </li>
            
          </ul>

          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="visa" role="tabpanel" aria-labelledby="visa-tab">
             <div class="mt-4 mx-4">
                <div class="text-center">
                  <h5>Card Payment</h5>
                </div>
                <div class="form mt-3">
                <form action="DoPayment?username=<%= (String) session.getAttribute("username")%>" method="post">
                  <div class="inputbox">
                    <input type="text" name="name" class="form-control" required>
                    <span>Cardholder Name</span>
                  </div>
                  <div class="inputbox">
                    <input type="text" name="name" min="1" max="999" class="form-control"  required>
                    <span>Card Number</span>
                    <i class="fa fa-eye"></i>
                  </div>
                  <div class="d-flex flex-row">
                    <div class="inputbox">
                      <input type="text" name="name" min="1" max="999" class="form-control" required>
                      <span>Expiration Date</span>
                    </div>
                    <div class="inputbox">
                      <input type="number" name="name" min="1" max="999" class="form-control" required>
                      <span>CVV</span>
                    </div>
                  </div>
                  <div class="px-5 pay">                  	
	                    <button class="btn btn-success btn-block">Pay Online</button>
                  </div>
                </form>
                </div>
             </div>
            </div>
            
            
            
          <div class="tab-pane fade" id="paypal" role="tabpanel" aria-labelledby="paypal-tab">
              <div class="px-5 mt-5">
              	<div class="text-center">
                  <h5>Cash On Delivery</h5>
                </div>
                <form action="DoPayment?username=<%= (String) session.getAttribute("username")%>" method="post">
	                <div class="inputbox">
	                  <input type="text" name="name" class="form-control"  required>
	                  <span>Enter Address</span>
	                </div>
	                <div class="pay px-5">
		                  <button class="btn btn-primary btn-block">Pay Cash</button>
	                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
		
		
		
	</div>
		<%@ include file="footer.jsp" %>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>


