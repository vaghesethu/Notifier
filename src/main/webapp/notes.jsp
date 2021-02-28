<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="notifier.beans.*" %>
    <%@page import="notifier.util.*" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>notes</title>
<style type="text/css">
div {
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
}</style>
</head>
<body>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/userdetails";
String username = "root";
String password = "abc";
HttpSession ses=request.getSession();
String notename=(String) ses.getAttribute("notebook");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
try{
Connection con = DriverManager.getConnection(url, username, password);
String sql ="select note from notes where notename=?";
PreparedStatement pstm = con.prepareStatement(sql);
pstm.setString(1, notename);
ResultSet rs = pstm.executeQuery();
while(rs.next()){ 
%>
<br>
<div >
<%=rs.getString("note")%>
<%=notename%>
</div>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>