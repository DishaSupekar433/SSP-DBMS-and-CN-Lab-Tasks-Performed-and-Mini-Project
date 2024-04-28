<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
            background-image: url('https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?cs=srgb&dl=pexels-fauxels-3183150.jpg&fm=jpg');
            background-size: cover;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .container {
            max-width: 420px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label, input, select {
            display: block;
            text-align: left;
        }
        input[type="text"],
        input[type="password"],
        select {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
        h2 {
            color: blue;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Employee Task Management System - Login</h2>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="Emp_ID">Employee ID:</label>
                <input type="text" id="Emp_ID" name="Emp_ID" required>
            </div>
            <div class="form-group">
                <label for="Password">Password:</label>
                <input type="Password" id="Password" name="Password" required>
            </div>
            <div class="form-group">
                <label for="Role">Role:</label>
                <select id="Role" name="Role">
                    <option value="Employee">Employee</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>
            <input type="submit" value="Login">
            <p>Don't have an account? <a href="register.jsp">Register</a></p>
        </form>
    </div>
</body>
</html>

<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<form action=login method=post>
		<label> Employee ID: </label>
		<input type=text name="Emp_id"> <br> <br>
		<label> Password:</label>
		<input type="password" name="password"> <br> <br>
		<label> Role: </label>
		<select name="role">
    		<option value="employee">Employee</option>
    		<option value="admin">Admin</option>
		</select>
		<input type=submit value="Login"> 
		Don't have an account? <a href="register.jsp">Register</a>
	</form>
</body>
</html>
-->