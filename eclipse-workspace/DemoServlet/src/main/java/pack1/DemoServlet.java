package pack1;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/submitform")
public class DemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
    	String myname = req.getParameter("name");
    	String myemail = req.getParameter("email");
    	
    	PrintWriter out = res.getWriter();
    	out.println("<h1>My name is "+myname+"</h1>");
    	out.println("<h1>My email is "+myemail+"</h1>");
	}
}
