<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Assignment Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        h1 {
            background-color: #007BFF;
            color: white;
            padding: 10px;
        }
        div.result {
            max-width: 400px;
            margin: 0 auto;
            padding: 10px 10px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        p {
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Task Assignment Result</h1>
    <div class="result">
        <%
            Connection con = null;
            PreparedStatement ps = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_task_management", "root", "FINAL");

                String Task_ID = request.getParameter("Task_ID");
                String Assigned_To = request.getParameter("Assigned_To");
                String Title = request.getParameter("Title");
                String Description = request.getParameter("Description");
                String Due_Date = request.getParameter("Due_Date");
                if (java.time.LocalDate.parse(Due_Date).isBefore(java.time.LocalDate.now())) {
        %>
                    <p>Error: Due date must be today or a future date.</p>
        <%
                } else {
                String query = "INSERT INTO Tasks (Task_ID, Assigned_To, Title, Description, Due_Date) VALUES (?, ?, ?, ?, ?)";
                ps = con.prepareStatement(query);
                ps.setString(1, Task_ID);
                ps.setString(2, Assigned_To);
                ps.setString(3, Title);
                ps.setString(4, Description);
                ps.setString(5, Due_Date);
                }
                int rowsAffected = ps.executeUpdate();
  
                if (rowsAffected > 0) {
		%>
						<p>Task has been successfully assigned to the employee.</p>
		<%
                } else {
        %>
        	    		<p>Error: Task assignment failed. Please try again.</p>
        <%
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
        %>
        <p>Error: An unexpected error occurred. Please try again later.</p>
        <%
            } finally {
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        %>
    </div>
</body>
</html>
