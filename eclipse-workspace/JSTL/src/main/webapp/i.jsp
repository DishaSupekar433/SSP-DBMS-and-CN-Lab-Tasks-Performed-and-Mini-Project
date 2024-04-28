<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
<h1>Core tag demo</h1>
<!-- 1. set and out tag -->
<c:set var="i" value="50"></c:set>
<h1><c:out value="${i}">This is default value</c:out></h1>

<!-- 2. remove tag -->
<!--<c:remove var="i"/>-->

<!-- 3. if tag -->
<c:if test="${i==50}">
    <h1>The value is 50</h1>
</c:if>

<!-- 4. choose when otherwise -->
<c:choose>
    <c:when test="${i>0}">
        <h1>This is first case</h1>
        <h2>positive number</h2>
    </c:when>
    <c:otherwise>
        <h1>Default case</h1>
    </c:otherwise>
</c:choose>

<!-- 5. for loop -->
<c:forEach var="j" begin="1" end="10">
    <c:out value="${j}"></c:out>
</c:forEach>

<!--
<c:url var="myurl" value="https://www.google.com">
    <c:param name="q" value="JSTL"></c:param>
</c:url>

<c:redirect url="${myurl}"></c:redirect>
-->
</body>
</html>
