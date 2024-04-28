package CookiePack;

import java.io.PrintWriter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("servlet2")
public class Second extends HttpServlet {
	@Override 
	public void service(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			Cookie ck[] = request.getCookies();
			for(int i=0; i<=ck.length; i++) {
				out.print("<h1>Hello "+ck[i].getValue()+"!!!</h1>");
			}
			out.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}
