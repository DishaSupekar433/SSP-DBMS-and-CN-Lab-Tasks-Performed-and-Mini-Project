<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Scripting Elements</title>
</head>
<body>
<%!
int a=20;
String name="Welcome";
int square(){
	return a*a;
}
%>
<h2>
<%=name+" Everyone!!"%><br>
</h2>
<%
int b=10;
out.println("b: "+b);
if(b<100){
	out.println("<br>b is smaller than 100");
}
else {
	out.println("<br>b is greater than 100");
}
%><br><br>
<%
out.println("Numbers from 1-20: ");
for(int i=1;i<=20;i++)
{
	out.println(i+", ");
}
%><br><br>
<%="a: "+a%><br>
<%="a's square: "+square()%>
</body>
</html>