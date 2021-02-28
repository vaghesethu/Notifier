package notifier.util;

import javax.servlet.http.HttpSession;

import notifier.beans.UserDetails;



public class MyUtils {
	public static void storeLoginedUser(HttpSession session, UserDetails user) 
	{
		 session.setAttribute("user", user);	
	}
	 public static UserDetails getLoginedUser(HttpSession session)
	 {
	        UserDetails loginedUser = (UserDetails) session.getAttribute("user");
	        return loginedUser;
	  }

	
}
