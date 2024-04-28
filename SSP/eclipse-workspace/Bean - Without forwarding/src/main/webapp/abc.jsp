<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="u" class="student.student"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<h2>The record is</h2>
ID:<jsp:getProperty property="id" name="u"/><br>
Name:<jsp:getProperty property="name" name="u"/><br>
Address:<jsp:getProperty property="address" name="u"/>
</body>
</html>