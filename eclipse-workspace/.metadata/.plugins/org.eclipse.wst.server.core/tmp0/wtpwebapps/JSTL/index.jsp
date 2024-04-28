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
<h2><c:out value="${i}"></c:out> - This is default value</h2>

<!-- 2. remove tag -->
<!--<c:remove var="i"/>-->

<!-- 3. if tag -->
<c:if test="${i!=10}">
    <h2>The value is not 10</h2>
</c:if>

<!-- 4. choose when otherwise -->
<c:choose>
    <c:when test="${i==50}">
        <h2>This is first case</h2>
    </c:when>
    <c:otherwise>
        <h2>Default case is true</h2>
    </c:otherwise>
</c:choose>

<!-- 5. for loop -->
<c:forEach var="j" begin="1" end="10">
    <c:out value="${j}"></c:out>
</c:forEach>

</body>
</html>
