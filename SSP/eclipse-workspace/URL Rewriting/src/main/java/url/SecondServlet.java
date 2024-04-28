package url;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SecondServlet") 

public class SecondServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		try {

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String n = request.getParameter("uname");
			out.print("Hello " + n);
			out.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}

