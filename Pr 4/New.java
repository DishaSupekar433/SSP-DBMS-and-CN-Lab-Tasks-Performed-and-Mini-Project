import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class New extends HttpServlet {
	ServletConfig conf;
	public void init (ServletConfig conf) {
		this.conf = conf;
		System.out.println("Creating Object");
	}
	public void service (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("Servicing");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("<h1>This is my output from servlet method</h1>");
		out.println("<h1>Today's date "+new Date().toString()+"</h1>");
	}
	public void destroy () {
		System.out.println("object is destroying");
	}
}
		