package Register;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				try {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","FINAL");

					String f_name = request.getParameter("FName");
					String l_name = request.getParameter("LName");
					String email = request.getParameter("Email");
					String phone = request.getParameter("Phone");
					String age = request.getParameter("Age");
					PreparedStatement ps = con.prepareStatement("insert into register values (?,?,?,?,?)");                                                                                              
					ps.setString(1,f_name);
					ps.setString(2,l_name);
					ps.setString(3,email);
					ps.setString(4,phone);
					ps.setString(5,age);
					int i = ps.executeUpdate();
					if(i>0){
						response.setContentType("text/html");
						RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
						rd.include(request, response);
					}
					else {
						response.setContentType("text/html");
						out.println("<font color = red size=18>Registration Failed!!<br>");
						out.println("<a href=Register.jsp>Try Again</a>");
					}
				}
				catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
	}
}
