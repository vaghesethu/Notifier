<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
    <%@page import="notifier.beans.*" %>
    <%@page import="notifier.util.*" %>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Edit User</title>
<style>
body{
 background-color:lightgrey;
}
div{
  position: relative;
  background:white ;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 15px;
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
  width: 30%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  cursor: pointer;
}
.close{
background: lightgrey;
  width: 20%;
  border: 0;
  color: black;
  cursor: pointer;
}
</style>
</head>
<body>
<%
response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");

if(session.getAttribute("user")==null)
{
	response.sendRedirect("index.jsp");
}
HttpSession ses=request.getSession();
UserDetails user=MyUtils.getLoginedUser(ses);
int id=user.getId();
String username=user.getUserName();
String mobile=user.getMobileNumber();
String email=user.getEmail();
String password=user.getPassword();
%>
<form  action="home.jsp">
<button class="close">X</button>
</form>
<div>
<form action="edituser" onsubmit="return check()" method="post">
Edit User<br><br>
<input type="text" placeholder=<%=username%> id="name" name="name" required 
oninvalid="this.setCustomValidity('Enter User Name')"oninput="this.setCustomValidity('')">
<input type="number" placeholder=<%=mobile %> id="mobile" name="mobile" required  
oninvalid="this.setCustomValidity('Enter Mobile Number')"oninput="this.setCustomValidity('')">
<input type="text" placeholder=<%=email %> id="email" name="email" required
oninvalid="this.setCustomValidity('Enter Email')"oninput="this.setCustomValidity('')">
<input type="password" placeholder="password" id="password" name="password" required
oninvalid="this.setCustomValidity('Enter Password')"oninput="this.setCustomValidity('')">
<button>Save</button><br><br>
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
}
</script>
</body>
</html>