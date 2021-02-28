<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="notifier.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Notifier</title>
<style>
h2{
text-align:center;
}
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
</head>
<body>
<h2><b>Remind Me</b></h2>
<div>
<p style="font-size:20px;"><b>Login</b></p>
<form action="login" onsubmit="return check()" method="post" >
<input type="text" placeholder="username" id="name" name="name" required 
oninvalid="this.setCustomValidity('Enter User Name')"oninput="this.setCustomValidity('')"><br>
<input type="password" placeholder="password" id="password" name="password" 
required oninvalid="this.setCustomValidity('Enter Password')"oninput="this.setCustomValidity('')"><p id="div1"></p><br>
<button >Login</button><br><br>
Not a member? <a href="newaccnt.jsp">Sign Up</a>
</form>
</div>  

</body>
</html>
