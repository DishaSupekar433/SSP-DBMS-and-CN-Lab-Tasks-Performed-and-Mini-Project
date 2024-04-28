package login_register;

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
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_task_management","root","FINAL");

					String Emp_ID = request.getParameter("Emp_ID");
					String First_Name = request.getParameter("First_Name");
					String Last_Name = request.getParameter("Last_Name");
					/*String Street = request.getParameter("Street");
					String City = request.getParameter("City");
					String State = request.getParameter("State");*/
					String Date_Of_Joining= request.getParameter("Date_Of_Joining");
					String Phone_No= request.getParameter("Phone_No");
					/*String Alternate_phone= request.getParameter("Alternate_Phone");*/
					String Email= request.getParameter("Email");
					String Password= request.getParameter("Password");
					//String Role = "Employee";
					
					PreparedStatement ps = con.prepareStatement("INSERT INTO Employee (Emp_ID, First_Name, Last_Name, Date_Of_Joining, Phone_No, Email, Password) values (?,?,?,?,?,?,?)");                                                                                              
					ps.setString(1,Emp_ID);
					ps.setString(2,First_Name);
					ps.setString(3,Last_Name);
					/*ps.setString(3,Last_Name);
					ps.setString(4,Street);
					ps.setString(5,City);
					ps.setString(6,State);*/
					ps.setString(4,Date_Of_Joining);
					ps.setString(5,Phone_No);
					/*ps.setString(9,Alternate_Phone);*/
					ps.setString(6,Email);
					ps.setString(7,Password);
					//ps.setString(7,Role);
					
					int i = ps.executeUpdate();
					if(i>0){
						response.setContentType("text/html");
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.include(request, response);
					}
					else {
						response.setContentType("text/html");
		                String message = "Registration Failed!! Try Again";
		                String script = "<script type='text/javascript'>alert('" + message + "');</script>";
		                response.getWriter().write(script);
		                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		                rd.include(request, response);
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
