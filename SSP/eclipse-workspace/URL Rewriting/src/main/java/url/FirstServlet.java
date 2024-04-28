package url;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/FirstServlet") 

public class FirstServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String n = request.getParameter("userName");
			out.print("Welcome " + n);
			out.print("<a href='SecondServlet?uname=" + n + "'>visit</a>");
			out.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}

