<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Date</title>
</head>
<body>
<%@ page import="java.util.Date" %>
<%
  Date date = new Date();
%>
<p>The current date and time is: <%= date %></p>
</body>
</html>