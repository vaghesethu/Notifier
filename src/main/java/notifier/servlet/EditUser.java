package notifier.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notifier.beans.UserDetails;
import notifier.conn.UserDAO;
import notifier.util.MyUtils;

@SuppressWarnings("serial")
@WebServlet("/edituser")
public class EditUser extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException  {
		String username=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String password=request.getParameter("password");		
		UserDAO dao=new UserDAO();
		HttpSession ses=request.getSession();
		UserDetails user=MyUtils.getLoginedUser(ses);
		try {
			Connection con=dao.add();
			String sql="Update userlogin set name =?,password =?,mobile=?,email=? where id=?";
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1, username);
			pstm.setString(2,password);
			pstm.setString(3,mobile);
			pstm.setString(4,email);
			pstm.setInt(5, user.getId());
			int i=pstm.executeUpdate();
		        if(i > 0)
		        {
		        System.out.print("Record Updated Successfully");
		        }
		        else
		        {
		        	System.out.print(user.getUserName()+" "+user.getPassword()+" "+user.getMobileNumber()+" "+user.getEmail()+" "+user.getId());
		        System.out.print("There is a problem in updating Record.");
		        }
		}catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
    	MyUtils.storeLoginedUser(session, user);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/home.jsp");
		dispatcher.forward(request, response);
	}
}
