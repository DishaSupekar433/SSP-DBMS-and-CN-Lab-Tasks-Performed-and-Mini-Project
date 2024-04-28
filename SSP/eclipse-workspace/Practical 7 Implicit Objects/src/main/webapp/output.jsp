<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Output</title>
</head>
<body>
<% 
	String myname = request.getParameter("name");
	out.println(myname+"'s");
%>
<%
	String sname = (String)session.getAttribute("session_name");
	out.println(sname);
%>
</body>
</html>