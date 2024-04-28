package CookiePack;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

//@WebServlet("servlet1")
public class First extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			String n = request.getParameter("name");
			out.print("<h1>Welcome to 1st servlet " +n+ ".</h1>");

			Cookie ck = new Cookie("uname",n);
			response.addCookie(ck);

			out.print("<form action = 'servlet2'>");
			out.print("<br><input type='submit' value='Next'>");
			out.print("</form>");
			out.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}
