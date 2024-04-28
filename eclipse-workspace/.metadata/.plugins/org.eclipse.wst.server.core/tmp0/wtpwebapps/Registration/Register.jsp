<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<form action=RegisterServlet method=post>
		<label> First Name: </label>
		<input type=text name=Name> <br> <br>
		<label> Last Name: </label>
		<input type=text name="LName"> <br> <br>
		<label> Email: </label>
		<input type=text name="Email"> <br> <br>
		<label> Phone: </label>
		<input type=text name="Phone"> <br> <br>
		<label> Age:</label>
		<input type=text name="Age"> <br> <br>
		<input type=submit value="Register"> 
	</form>
</body>
</html>