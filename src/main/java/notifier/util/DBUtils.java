package notifier.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import notifier.beans.NotebookDetails;
import notifier.beans.Notes;
import notifier.beans.UserDetails;

public class DBUtils {
	public static UserDetails findUser(Connection con,String name,String password) throws SQLException {
		String sql = "Select * from userlogin where name=? and password=? "; 
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, name);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
        UserDetails user=new UserDetails();
        if (rs.next()) {
        	int id=rs.getInt("id");
        	String mobile=rs.getString("mobile");
        	String email=rs.getString("email");
        	user.setId(id);
        	user.setUserName(name);
        	user.setPassword(password);
        	user.setMobileNumber(mobile);
        	user.setEmail(email);
            return user;
        }
        return null;
	}
	public static void UpdateUser(Connection con, UserDetails user) throws SQLException {
		String sql = "Insert into userlogin values(?,?,?,?,?);"; 
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, user.getId());
        pstm.setString(2, user.getUserName());
        pstm.setString(3,user.getPassword());
        pstm.setString(4,user.getMobileNumber());
        pstm.setString(5,user.getEmail());        
        pstm.executeUpdate();
	}
	public static void AddNotebook(Connection con, NotebookDetails notebook) throws SQLException {
		String sql = "Insert into notebook values(?,?);"; 
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, notebook.getName());
        pstm.setString(2,notebook.getNotebookname());
        pstm.executeUpdate();
	}
	public static void AddNotes(Connection con, Notes n) throws SQLException {
		String sql = "Insert into notes values(?,?,?,?,?);"; 
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,n.getNotebook());
        pstm.setString(2,n.getStart());
        pstm.setString(3,n.getEnd());
        pstm.setString(4,n.getRemainder());
        pstm.setString(5,n.getNote());
        pstm.executeUpdate();
        		
		
	}
	

}
