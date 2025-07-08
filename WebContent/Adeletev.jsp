<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<title>Aarogya Vibhag - Delete</title>
<style>
    body {
        background: #e4f1ff;
        font-family: "Poppins", "Montserrat", sans-serif;
        margin: 0;
        padding: 10px;
    }

    h2 {
        text-align: center;
        margin: 10px 0 20px 0;
        color: #153049;
    }

    table {
        border-collapse: collapse;
        width: 80%;
        margin: 0 auto;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 8px 12px;
        text-align: center;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    th {
        background-color: #658fb9;
        color: white;
    }

    td {
        background-color: #f7fbff;
    }

    .delete-btn {
        background-color:#ce5a4e;
        color: white;
        border: none;
        padding: 6px 12px;
        font-size: 13px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.2s ease;
        font-family: "Poppins", "Montserrat", sans-serif;
    }

    .delete-btn:hover {
        background-color:#a94438;
    }
</style>
</head>
<body>

<%
Connection con = Dbconnection.connect();
try {
    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM aarogya");
    ResultSet rs = pstmt.executeQuery();
%>

<h2>Aarogya Vibhag</h2>
<table>
<tr>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Village</th>
    <th>District</th>
    <th>Action</th>
</tr>
<% while(rs.next()) { %>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(6) %></td>
    <td><%= rs.getString(7) %></td>
    <td>
        <a href="delete.jsp?id=<%= rs.getInt(1) %>">
            <button class="delete-btn">Delete</button>
        </a>
    </td>
</tr>
<% }
} catch(Exception e) {
    e.printStackTrace();
}
%>
</table>

</body>
</html>
