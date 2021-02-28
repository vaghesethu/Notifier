package notifier.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notifier.beans.UserDetails;
import notifier.conn.UserDAO;
import notifier.util.DBUtils;
import notifier.util.MyUtils;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		String user=request.getParameter("name");
		String pass=request.getParameter("password");
		
		UserDAO dao=new UserDAO();
        Connection con=dao.validate(user, pass);
        UserDetails us=null;
        try {
			us=DBUtils.findUser(con,user,pass);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
        if(us==null)
        {
        	response.sendRedirect("index.jsp");
        	
        }else{ 
        	HttpSession session=request.getSession();
        	MyUtils.storeLoginedUser(session, us);
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/home.jsp");
			dispatcher.forward(request, response);
        }
        	
  	}
}
