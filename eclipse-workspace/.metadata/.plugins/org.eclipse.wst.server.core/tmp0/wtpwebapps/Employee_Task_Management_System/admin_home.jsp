<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assign Tasks</title>
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
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        label {
            display: block;
            text-align: left;
            margin: 10px 0;
        }
        select, input[type="text"], textarea, input[type="date"] {
            width: 100%;
            padding: 5px 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        textarea {
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px ;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        	margin-top: 40px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
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
    <h1>Assign Tasks</h1>
    <div class="user-info">
        <i class="user-icon"></i>
        User: <%= session.getAttribute("Emp_ID") %> (<%= session.getAttribute("Role") %>)
    </div>
    <form action="assign_task.jsp" method="post">
        <label for="Employee">Select Employee:</label>
        <select name="Assigned_To">
            <% 
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_task_management", "root", "FINAL");
                    String query = "SELECT Emp_ID, First_Name, Last_Name FROM Employee";
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
							            %>
							            <option value="<%= rs.getString("Emp_ID") %>"><%= rs.getString("First_Name") %> <%= rs.getString("Last_Name") %></option>
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
        </select>
        <label for="Task_ID">Task ID:</label>
        <input type="text" name="Task_ID" placeholder="must be unique">
        <label for="Title">Task Title:</label>
        <input type="text" name="Title">
        <label for="Description">Task Description:</label>
        <textarea name="Description" rows="4" cols="50"></textarea>
        <label for="Due_Date">Due Date:</label>
		<input type="date" name="Due_Date" min="<%= java.time.LocalDate.now() %>" required>
        <input type="submit" value="Assign Task">
    </form><br>
    <a href='see_tasks.jsp'>See all the Tasks</a><br><br>
    <a href='see_emp.jsp'>See all the Employees</a>
</body>
</html>
