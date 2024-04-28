<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

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

    </style>
</head>
<body>
    <h1>Tasks Assigned</h1>
    <table>
        <tr>
            <th>Task ID</th>
            <th>Assigned To</th>
            <th>Task Name</th>
            <th>Task Description</th>
            <th>Due Date</th>
            <th>Status</th>
        </tr>
        <%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_task_management", "root", "FINAL");

    String query = "SELECT * FROM Tasks";
    ps = con.prepareStatement(query);
    rs = ps.executeQuery();

    while (rs.next()) {
        String taskId = rs.getString("Task_id");
        String status = rs.getInt("status") == 1 ? "Completed" : "Pending";
%>
<tr>
    <td><%= taskId %></td>
    <td><%= rs.getString("emp") %></td>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getString("description") %></td>
    <td><%= rs.getString("due_date") %></td>
    <td><%= status %></td>
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
</html>--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Tasks</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td, form {
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
    </style>
</head>
<body>
    <h1>Tasks Assigned</h1>

    <form action="#" method="get">
        <label for="sortBy">Sort by:</label>
        <select name="sortBy">
            <option value="Status">Status</option>
            <option value="Due_Date">Due Date</option>
        </select>
    
        <label for="sortOrder">Sort order:</label>
        <select name="sortOrder">
            <option value="asc">Ascending</option>
            <option value="desc">Descending</option>
        </select>
    
        <input type="submit" value="Sort">
    </form>

    <table>
        <tr>
            <th>Task ID</th>
            <th>Assigned To</th>
            <th>Task Name</th>
            <th>Task Description</th>
            <th>Due Date</th>
            <th>Status</th>
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

            
            String query = "SELECT * FROM Tasks ORDER BY " + columnToSort + " " + sortOrder;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                String Task_ID = rs.getString("Task_ID");
                String Status = rs.getInt("Status") == 1 ? "Completed" : "Pending";
        %>
        <tr>
            <td><%= Task_ID %></td>
            <td><%= rs.getString("Assigned_To") %></td>
            <td><%= rs.getString("Title") %></td>
            <td><%= rs.getString("Description") %></td>
            <td><%= rs.getString("Due_Date") %></td>
            <td><%= Status %></td>
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
