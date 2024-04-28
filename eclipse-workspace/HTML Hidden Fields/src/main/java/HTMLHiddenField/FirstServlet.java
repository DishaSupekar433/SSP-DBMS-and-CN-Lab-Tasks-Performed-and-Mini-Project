package HTMLHiddenField;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/FirstServlet")

public class FirstServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String username = request.getParameter("userName");
			out.print("Welcome " + username);
			out.print("<form action='SecondServlet'>");
			out.print("<input type='hidden' name='username' value='" + username + "'>");
			out.print("<input type='submit' value='submit'>");
			out.print("</form>");
			out.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}

