<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.util.Date,java.text.*" %>  
<html>
<head>
    <title>SQL Tags</title>
    <style>
        table {
            width: 30%;
            border: 2px solid black;
        }
        th, td {
            text-align: center; /* Center-align table cell contents */
            padding: 5px;
            border: 2px solid black
        }
    </style>
</head>
<body>

<c:set var="dbUrl" value="jdbc:mysql://localhost/test" />
<c:set var="dbUser" value="root" />
<c:set var="dbPassword" value="FINAL" />

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="${dbUrl}"
                   user="${dbUser}" password="${dbPassword}"/>

<!-- Query the database -->
<sql:query dataSource="${db}" var="rs">
    SELECT * FROM Students;
</sql:query>

<!-- Display the original table -->
<h2>Original table:</h2>
<table>
    <tr>
        <th>PRN</th>
        <th>Name</th>
        <th>Date of Birth</th>
    </tr>
    <c:forEach var="table" items="${rs.rows}">
        <tr>
            <td><c:out value="${table.PRN}"/></td>
            <td><c:out value="${table.Name}"/></td>
            <td><c:out value="${table.dob}"/></td>
        </tr>
    </c:forEach>
</table>
<%  
Date DoB = new Date("2000/10/16");   
%>
<!-- Start a transaction -->
<sql:transaction dataSource="${db}">
    <!-- Insert a new row into the database using sql:update with sql:param and sql:dateParam -->
    <sql:update var="count">
    INSERT INTO Students (PRN, Name, DOB) VALUES (?, ?, ?);
    <sql:param value="1111"/>
    <sql:param value="ABC"/>
    <sql:dateParam value="<%=DoB%>" type="DATE"/>
	</sql:update>
    

    <!-- Query the database again to display the updated table -->
    <sql:query var="rs">
        SELECT * FROM Students;
    </sql:query>
	<br><br>
    <!-- Display the table after inserting more rows -->
    <h2>Table after inserting more rows:</h2>
    <table>
        <tr>
            <th>PRN</th>
            <th>Name</th>
            <th>Date of Birth</th>
        </tr>
        <c:forEach var="table" items="${rs.rows}">
            <tr>
                <td><c:out value="${table.PRN}"/></td>
                <td><c:out value="${table.Name}"/></td>
                <td><c:out value="${table.dob}"/></td>
            </tr>
        </c:forEach>
    </table>
</sql:transaction>

</body>
</html>
