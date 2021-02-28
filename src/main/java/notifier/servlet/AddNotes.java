package notifier.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notifier.beans.Notes;
import notifier.conn.UserDAO;
import notifier.util.DBUtils;

@WebServlet("/addnotes")
@SuppressWarnings("serial")
public class AddNotes extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException  {
		String notes=request.getParameter("notes");
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		String remainder=request.getParameter("remainder");	
		HttpSession session=request.getSession();
		String notename=(String) session.getAttribute("notebook");
		Notes n=new Notes();
		n.setNotebook(notename);
		n.setStart(start);
		n.setEnd(end);
		n.setRemainder(remainder);
		n.setNote(notes);
		UserDAO dao=new UserDAO();
		try {
			Connection con=dao.add();
			DBUtils.AddNotes(con,n);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print(notename);
		response.sendRedirect("notes.jsp");
	}
}
