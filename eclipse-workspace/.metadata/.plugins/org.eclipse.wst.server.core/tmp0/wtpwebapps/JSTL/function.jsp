<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Function</title>
</head>
<body>
<h2>This is a Function tag demo</h2>
<c:set var="name" value="MGMUniversityJNEC"></c:set>
<p>String: <c:out value="${name }"></c:out></p>
<p>Length of string: <c:out value="${fn:length(name) }"></c:out></p>
<p>All Upper Case: <c:out value="${fn:toUpperCase(name) }"></c:out></p>
<p>All Lower Case: <c:out value="${fn:toLowerCase(name) }"></c:out></p>
<p>Sub String: <c:out value="${fn:substring(name, 3, 13)} "></c:out></p>
<p>Does the string contain 'JNEC'?: </p>
<c:if test="${fn:containsIgnoreCase(name, 'JNEC')}"/>
   Found JNEC string<br><br>
<c:set var="author" value="Disha Supekar"/>  
<c:set var="string" value="abcdefghijklmnopqrstuvwxyz"/>  
${fn:replace(author, "Jane", "Doe")}  
${fn:replace(string, "hey", "hello")} <br><br>
<c:set var="msg" value="The Example of JSTL Function"/>  
String: <c:out value="${msg}"></c:out><br><br>
The string starts with "The": ${fn:startsWith(msg, 'The')}  
<br>The string starts with "Example": ${fn:startsWith(msg, 'Example')}
<br>The string ends with "Function": ${fn:endsWith(msg, 'Function')}
<br>The string ends with ".": ${fn:endsWith(msg, '.')}
<c:set var="str1" value="Welcome-to-JSP-Programming."/>  
<c:set var="str2" value="${fn:split(str1, '-')}" />  
<c:set var="str3" value="${fn:join(str2, ' ')}" />  
<p>Old String: ${str3}</p>  
<c:set var="str4" value="${fn:split(str3, ' ')}" />  
<c:set var="str5" value="${fn:join(str4, '-')}" />  
<p>New String : ${str5}</p>  
<c:set var="str1" value="Welcome to JSP        programming         "/>  
<p>String-1 Length is : ${fn:length(str1)}</p>  
<c:set var="str2" value="${fn:trim(str1)}" />  
<p>String-2 Length is : ${fn:length(str2)}</p>  
<p>Final value of string is : ${str2}</p>  
</body>
</html>