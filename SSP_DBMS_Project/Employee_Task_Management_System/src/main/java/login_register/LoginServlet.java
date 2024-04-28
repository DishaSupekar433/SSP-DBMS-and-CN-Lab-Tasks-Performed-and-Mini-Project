package login_register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				try {
					PrintWriter out = response.getWriter();
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_task_management","root","FINAL");

					String id = request.getParameter("Emp_ID");
					String pass = request.getParameter("Password");
					String r = request.getParameter("Role");

					PreparedStatement ps = con.prepareStatement("SELECT Emp_ID, Password, Role from Employee WHERE Emp_ID = ? AND Password = ? AND Role = ?");                                                                                              
					ps.setString(1,id);
					ps.setString(2,pass);
					ps.setString(3,r);
			
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						HttpSession session = request.getSession(); 
		                session.setAttribute("Emp_ID", id); 
		                session.setAttribute("Role", r);
						if("Employee".equals(r)) {
						
							 request.setAttribute("Emp_ID", id);
					
							RequestDispatcher rd = request.getRequestDispatcher("emp_home.jsp");
							rd.forward(request, response);
						}
						else {
							RequestDispatcher rd = request.getRequestDispatcher("admin_home.jsp");
							rd.forward(request, response);
						}
					}
					else {
						response.setContentType("text/html");
		                String message = "Login Failed!! Try Again";
		                String script = "<script type='text/javascript'>alert('" + message + "');</script>";
		                response.getWriter().write(script);
		                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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

/*
package login_register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_task_management", "root", "FINAL");

            String id = request.getParameter("Emp_id");
            String pass = request.getParameter("password");
            String role = request.getParameter("role");

            // Use a proper SQL query with placeholders instead of using commas in the WHERE clause
            ps = con.prepareStatement("SELECT Emp_id, password, role FROM Employee WHERE Emp_id = ?, password = ?, role = ?");
            ps.setString(1, id);
            ps.setString(2, pass);
            ps.setString(3, role);

            rs = ps.executeQuery();

            if (rs.next()) {
                if ("admin".equals(role)) { // Use .equals for String comparison
                    RequestDispatcher rd = request.getRequestDispatcher("Admin_Home.jsp");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("Emp_Home.jsp");
                    rd.forward(request, response);
                }
            } else {
                out.println("<font color='red' size='18'>Login Failed!!<br>");
                out.println("<a href='login.jsp'>Try Again</a>");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources in the reverse order they were opened
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}*/
