<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>abc</title>
</head>
<body>
<jsp:useBean id="u" class="pack.student" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<jsp:forward page="print.jsp"></jsp:forward>
</body>
</html>