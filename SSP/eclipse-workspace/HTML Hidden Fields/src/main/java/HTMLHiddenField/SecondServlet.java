package HTMLHiddenField;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet; // Importing annotation
import javax.servlet.http.*;

@WebServlet("/SecondServlet")

public class SecondServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			out.print("WELCOME " + username);
			out.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}
