<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Error</title>
</head>
<body>
<%@ page isErrorPage="true" %>
<%
    int z;
    try {
        z = 1 / 0;
    } catch (Exception e) {
        out.print("An error occurred: " + e.getMessage());
    }
%>
</body>
</html>
