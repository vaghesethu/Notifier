<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<style>
body{
   background-color:lightgrey;
}
div{
  position: relative;
  background:white ;
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
  width: 50%;
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
String notebookname=(String)request.getAttribute("notebook");
request.setAttribute("notebook", notebookname);
%>
<form  action="home.jsp">
<button class="close">X</button>
</form>
<div>
<form id="addnotes" action="addnotes"  method="post">
Add Notes<br><br>
Start<br><input type="date"  name="start" id="start"><br>
End<br><input type="date"  id="end" name="end"><br>
Remainder<br><input type="date"  id="remainder" name="remainder"><br>
Notes<br><input  type="text" placeholder="notes" id="notes" name="notes"><br>
<button>Submit</button><br>
</form>
</div>
</body>
</html>