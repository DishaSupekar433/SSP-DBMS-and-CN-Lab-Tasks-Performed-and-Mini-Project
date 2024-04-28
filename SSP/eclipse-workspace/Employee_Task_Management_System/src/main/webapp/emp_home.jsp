<%
String loggedInEmpId = (String) request.getAttribute("Emp_ID");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tasks Assigned</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: turquoise;
            color: white;
        }

        h1 {
            background-color: #007BFF;
            color: white;
            padding: 10px;
            text-align: center;
            margin-bottom: 60px;
        }
        .user-info {
        position: absolute;
        top: 10px;
        right: 10px;
        background: pink;
        color: black;
        padding: 10px 10px;
        margin-top: 20px;
        border-radius: 4px;
        font-size: 16px;
        font-weight: bold;
        display: flex;
        align-items: center;
        }
    </style>
</head>
<body>
    <h1>Tasks Assigned</h1>
    <div class="user-info">
        User: <%= session.getAttribute("Emp_ID") %> (<%= session.getAttribute("Role") %>)
    </div>
    <table>
        <tr>
            <th>Task ID</th>
            <th>Task Name</th>
            <th>Task Description</th>
            <th>Due Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_task_management", "root", "FINAL");
                String columnToSort = "Due_Date";
                String sortOrder = "ASC";

                if (request.getParameter("sortBy") != null) {
                    columnToSort = request.getParameter("sortBy");
                }

                if (request.getParameter("sortOrder") != null) {
                    sortOrder = request.getParameter("sortOrder");
                }

                String query = "SELECT * FROM Tasks WHERE Assigned_To = ? ORDER BY " + columnToSort + " " + sortOrder;
                ps = con.prepareStatement(query);
                ps.setString(1, loggedInEmpId); 
                rs = ps.executeQuery();

                while (rs.next()) {
                    String Task_ID = rs.getString("Task_ID");
                    String Status = rs.getInt("Status") == 1 ? "Completed" : "Pending";
        %>
        <tr>
            <td><%= Task_ID %></td>
            <td><%= rs.getString("Title") %></td>
            <td><%= rs.getString("Description") %></td>
            <td><%= rs.getString("Due_Date") %></td>
            <td><%= Status %></td>
            <td>
                <form action="UpdateStatusServlet" method="post">
                    <input type="hidden" name="Task_ID" value="<%= Task_ID %>">
                    <%
                        if (Status.equals("Completed")) {
                    %>
                    <button type="button" class="complete-button" disabled>Mark as Completed</button>
                    <%
                    } else {
                    %>
                    <button type="submit" class="complete-button">Mark as Completed</button>
                    <%
                    }
                %>
                </form>
            </td>
        </tr>
        <%
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        %>
    </table>
</body>
</html>
