<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
<% 
String name= "Welcome!";
out.println("<h2>"+name+"</h2>");
%>
<%
session.setAttribute("session_name","JSP program works!");
%>
<form action="output.jsp" method="get">
Enter your name: <input type="text" name="name" Placeholder="Name.."/>
<input type="submit" value="Submit"/>
</form>
</body>
</html>