<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>create account</title>
</head>
<style>
div{
  position: relative;
  background:#e6e4df ;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
 }
 input {
  background: #ffffff;
  width: 100%;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
button {
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  cursor: pointer;
}
</style>
<body>
<div>
<p style="font-size:20px;"><b>Sign Up</b></p>
<form  action="adduser" onsubmit="return check()" method="post">
<input type="text" placeholder="name" id="name" name="name" required 
oninvalid="this.setCustomValidity('Enter User Name')"oninput="this.setCustomValidity('')">
<input type="number" placeholder="mobilenumber" id="mobile" name="mobile" required
 oninvalid="this.setCustomValidity('Enter Mobile Number')"oninput="this.setCustomValidity('')">
<input type="text" placeholder="email" id="email" name="email" required 
oninvalid="this.setCustomValidity('Enter Email')"oninput="this.setCustomValidity('')">
<input type="password" placeholder="password" id="password" name="password" required 
oninvalid="this.setCustomValidity('Enter Password')"oninput="this.setCustomValidity('')">
<input type="password" placeholder="confirm_password" id="confirmpassword" name="confirmpassword" required 
oninvalid="this.setCustomValidity('Enter Password')"oninput="this.setCustomValidity('')"><br>
<span id = "message" style="color:red"> </span><br>
<button>Submit</button><br><br>
Already registered? <a href="index.jsp">Sign In</a>
</form>
</div>

<script>
function check(){
	var mobile=document.getElementById("mobile").value;
	var email=document.getElementById("email").value;
	var password=document.getElementById("password").value;
	var confirmpassword=document.getElementById("confirmpassword").value;
	var mailformat =/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;;
	if(mobile.length!=10){
		document.getElementById("message").innerHTML = "Invalid Mobile number";  
	     return false;  
	}
	if(!email.match(mailformat)){
		document.getElementById("message").innerHTML = "Invalid Email";  
	     return false;  
	}
	if(password!=confirmpassword){
		document.getElementById("message").innerHTML = "Password Mismatch";  
	     return false;  
	}
	else{
		document.getElementById("message").innerHTML = ""; 
		return true;
	}
}
</script>
</body>
</html>