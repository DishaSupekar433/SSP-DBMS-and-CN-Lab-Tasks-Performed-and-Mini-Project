<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<form action=LoginServlet method=post>
		<label> UserName: </label>
		<input type=text name=txtName> <br> <br>
		<label> Password:</label>
		<input type=password name="txtPwd"> <br> <br>
		<input type=submit value="Login"> 
	</form>
</body>
</html>