<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<title>Aarogya Vibhag Viewer</title>
<style>
    body {
        background: #e4f1ff;
        font-family: "Poppins", "Montserrat", sans-serif;
        margin: 0;
        padding: 30px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #153049;
        font-family: "Poppins", "Montserrat", sans-serif;
    }

    .form-container {
        display: flex;
        justify-content: center;
        margin-bottom: 30px;
    }

    form {
        background: #b7ecff69;
        padding: 20px 30px;
        border-radius: 10px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        width: 400px;
        font-family: "Poppins", "Montserrat", sans-serif;
    }

    label {
        font-size: 16px;
        display: block;
        margin-bottom: 8px;
    }

    input[type="text"] {
        width: 100%;
        padding: 8px 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 16px;
        margin-bottom: 15px;
        font-family: "Poppins", "Montserrat", sans-serif;
    }

    button {
        padding: 10px 20px;
        background-color: #658fb9;
        color: white;
        border: none;
        border-radius: 15px;
        font-size: 16px;
        cursor: pointer;
        width: 100%;
        transition: background 0.3s ease;
        font-family: "Poppins", "Montserrat", sans-serif;
    }

    button:hover {
        background-color: #153049;
    }

    table {
        border-collapse: collapse;
        margin: 0 auto;
        width: 95%;
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
        font-family: "Poppins", "Montserrat", sans-serif;
    }

    th, td {
        padding: 12px 16px;
        border: 1px solid #ccc;
        text-align: center;
        font-size: 15px;
    }

    th {
        background-color: #658fb9;
        color: white;
    }

    td {
        background-color: #f7fbff;
    }
</style>
</head>
<body>

<div class="form-container">
    <form action="Aviewd.jsp">   
	<h2>View by Name</h2>
        <label>Enter name to view specific details:</label>
        <input type="text" name="name" placeholder="Name of doctor">
        <button type="submit">View</button>
    </form>
</div>

<%
Connection con = Dbconnection.connect();
String name = request.getParameter("name");
System.out.println("Search name: [" + name + "]");

if (name == null) {
    try {
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM doctor");
        ResultSet rs = pstmt.executeQuery();
%>

<h2>All Doctors with Specialisation</h2>
<table>
<tr>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>City</th>
    <th>Specialisation</th>
    <th>Diseases Treated</th>
</tr>
<%
        while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(6) %></td>
    <td><%= rs.getString(7) %></td>
    <td><%= rs.getString(8) %></td>
</tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
} else {
    try {
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM doctor WHERE UPPER(name) LIKE ?");
        pstmt.setString(1, "%" + name.trim().toUpperCase() + "%");
        System.out.println("Search pattern: [%" + name.trim().toUpperCase() + "%]");
        ResultSet rs = pstmt.executeQuery();
%>

<h2>Doctor's Details</h2>
<table>
<tr>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>City</th>
    <th>Specialisation</th>
    <th>Diseases Treated</th>
</tr>
<%
        boolean found = false;
        while (rs.next()) {
            found = true;
%>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(6) %></td>
    <td><%= rs.getString(7) %></td>
    <td><%= rs.getString(8) %></td>
</tr>
<%
        }
        if (!found) {
%>
<tr><td colspan="7"><b>No matching record found.</b></td></tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
</table>

</body>
</html>
