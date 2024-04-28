<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Employees</title>
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
    <h1>Employee List</h1>

    <form action="#" method="get">
        <label for="sortBy">Sort by:</label>
        <select name="sortBy">
            <option value="Emp_ID">Employee ID</option>
            <option value="Date_Of_Joining">Date of Joining</option>
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
            <th>Employee ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Date of Joining</th>
            <th>Email</th>
        </tr>
        <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_task_management", "root", "FINAL");
            String columnToSort = "Emp_ID";
            
            String sortOrder = "ASC";

            if (request.getParameter("sortBy") != null) {
                columnToSort = request.getParameter("sortBy");
            }

            if (request.getParameter("sortOrder") != null) {
                sortOrder = request.getParameter("sortOrder");
            }

            
            String query = "SELECT * FROM Employee ORDER BY " + columnToSort + " " + sortOrder;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                String Id = rs.getString("Emp_ID");
              
        %>
        <tr>
            <td><%= Id %></td>
            <td><%= rs.getString("First_Name") %></td>
             <td><%= rs.getString("Last_Name") %></td>
            <td><%= rs.getString("Date_Of_Joining") %></td>
            <td><%= rs.getString("Email") %></td>
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
