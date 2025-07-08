<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Patients</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
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
            width: 85%;
            margin: 0 auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px 14px;
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

        .view-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            font-size: 13px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.2s ease;
            font-family: "Poppins", "Montserrat", sans-serif;
        }

        .view-btn:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<%
Connection con = Dbconnection.connect();
try {
    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM addcase"); 
    ResultSet rs = pstmt.executeQuery();
%>

<h2>Patient List</h2>
<table>
<tr>
    <th>Patient ID</th>
    <th>Name</th>
    <th>Age</th>
    <th>Gender</th>
    <th>City</th>
    <th>Action</th>
</tr>
<% while(rs.next()) { %>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getInt(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(5) %></td>
    <td>
        <a href="presc.jsp?pid=<%= rs.getInt(1) %>">
            <button class="view-btn">View Prescriptions</button>
        </a>
    </td>
</tr>
<% } %>
</table>

<%
} catch(Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
