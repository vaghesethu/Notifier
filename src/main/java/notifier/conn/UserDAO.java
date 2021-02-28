package notifier.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	String url="jdbc:mysql://localhost:3306/userdetails";
	String username="root";
	String password="abc";
	public Connection validate(String user, String pass) {
		String sql="select * from userlogin where Name=? and Password=BINARY? ";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			 PreparedStatement st=con.prepareStatement(sql);
			 st.setString(1, user);
			 st.setString(2, pass);
			 ResultSet rs=st.executeQuery();
			 if(rs.next()) 
			 {
				 return con;
			 }	 
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
	public Connection add() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			return con;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
