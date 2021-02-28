<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
    <%@page import="notifier.beans.*" %>
    <%@page import="notifier.util.*" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
button{
  background: white;
  border: thin solid grey;
  width:300px;
  padding: 15px;
  font-size: 14px;
  cursor: pointer;
  margin: 20px;
 }
body{
   background-color:lightgrey;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: black;
}
li {
  float: right;
}
li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
.sidenav {
  height: 100%;
  width: 250px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}
.sidenav a,p {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}
div {
  width: 25px;
  height: 3px;
  background-color: white;
  margin: 6px 0;
}
.close,.open{
  background: black;
  border: 0;
  color: white;
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
%>


<div class="sidenav" style="display:none" id="mySidebar">
  <button class="close" onclick="w3_close()" >&times;</button>
  <p>Hai ${user.userName}</p>
  <a href="home.jsp">Notebooks</a>
  <a href="notes.jsp">Notes</a>
  <a href="edituser.jsp">Edit</a>
</div>
<ul>
<li style="float:left">
<button class="open" onclick="w3_open()"><div></div><div></div>
<div></div></button></li>
<li><a href="logout"><i class="fa fa-sign-out" style="color:white"></i>Logout</a></li>
<li><a href="notify"><i class="fa fa-bell" style="color:white"></i></a></li>
<li><a href="addnewnotebook.jsp">New Notebook</a>New Notebook</li>
</ul>

<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/userdetails";
String username = "root";
String password = "abc";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
try{
Connection con = DriverManager.getConnection(url, username, password);
String sql ="select notename from notebook where name=?";
PreparedStatement pstm = con.prepareStatement(sql);
pstm.setString(1, user.getUserName());
ResultSet rs = pstm.executeQuery();
while(rs.next()){ 
	session.setAttribute("notebook", rs.getString("notename"));
%>
<br>
<form action="addnotes.jsp" method="post">
<button ><div class="notebook">
<%=rs.getString("notename")%>
</div></button></form>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
 <script>
function w3_open() {
  document.getElementById("mySidebar").style.width = "30%";
  document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>
</body>
</html>