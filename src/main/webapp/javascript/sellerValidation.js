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
