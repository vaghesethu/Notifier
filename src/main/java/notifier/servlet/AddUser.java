package notifier.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notifier.beans.UserDetails;
import notifier.conn.UserDAO;
import notifier.util.DBUtils;

@SuppressWarnings("serial")
@WebServlet("/adduser")
public class AddUser extends HttpServlet {
	static int count=1;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException  {
		String username=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		UserDetails add=new UserDetails();
		add.setId(count);
		count++;
		add.setUserName(username);
		add.setMobileNumber(mobile);
		add.setEmail(email);
		add.setPassword(password);
		UserDAO dao=new UserDAO();
		try {
			Connection con=dao.add();
			DBUtils.UpdateUser(con,add);
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("index.jsp");
	}
}
