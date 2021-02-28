<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Notebook</title>
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
response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");

if(session.getAttribute("user")==null)
{
	response.sendRedirect("index.jsp");
}
%>
<form  action="home.jsp">
<button class="close">X</button>
</form>
<div>
<form id="newnotebookpopup" action="notebook"  method="post">
NoteBookName<br><br>
<input type="text" placeholder="notebookname" id="notebookname" name="notebookname"><br>
<button>Submit</button><br>
</form>
</div>
</body>
</html>