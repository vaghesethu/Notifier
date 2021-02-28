package notifier.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notifier.beans.NotebookDetails;
import notifier.beans.UserDetails;
import notifier.conn.UserDAO;
import notifier.util.DBUtils;
import notifier.util.MyUtils;

@SuppressWarnings("serial")
@WebServlet("/notebook")
public class Notebook extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException  {
		String notebookname=request.getParameter("notebookname");
		NotebookDetails notebook=new NotebookDetails();
		HttpSession session=request.getSession();
		UserDetails add=MyUtils.getLoginedUser(session);
		notebook.setNotebookname(notebookname);
		notebook.setName(add.getUserName());
		UserDAO dao=new UserDAO();
		try {
			Connection con=dao.add();
			DBUtils.AddNotebook(con,notebook);
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("home.jsp");
   }
}
