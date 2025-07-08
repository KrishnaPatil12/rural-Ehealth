<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Comment Viewer</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
    body {
        background: #e4f1ff;
        font-family: "Poppins", "Montserrat", sans-serif;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 50px;
    }

    .form-box {
        background: #b7ecff69;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        width: 380px;
        margin-bottom: 30px;
    }

    h2 {
        text-align: center;
        color: #153049;
        margin-top: 0;
    }

    label {
        font-size: 15px;
        display: block;
        margin-bottom: 5px;
    }

    input {
        width: 100%;
        padding: 8px 10px;
        margin-bottom: 15px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-family: inherit;
        font-size: 15px;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #658fb9;
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-family: inherit;
    }

    button:hover {
        background-color: #153049;
    }

    table {
        border-collapse: collapse;
        margin-top: 20px;
        width: 80%;
        max-width: 700px;
        font-size: 15px;
    }

    th, td {
        padding: 12px 15px;
        border: 1px solid #ccc;
        text-align: center;
        background-color: #ffffff;
    }

    th {
        background-color: #d9efff;
    }

</style>
</head>
<body>
<%
Connection con = Dbconnection.connect();
String id = request.getParameter("pid");

if (id != null){
    try{
        int pid = Integer.parseInt(id);
        System.out.println(pid);
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM comment WHERE patient_id=?");
        pstmt.setInt(1, pid);
        ResultSet rs = pstmt.executeQuery();
        PreparedStatement npstmt=con.prepareStatement("Select * from addcase where id=?");
        npstmt.setInt(1,pid);
        ResultSet nrs=npstmt.executeQuery();
        if (rs.next()){
            if(nrs.next()){
%>
    <h2>Patient Details</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Patient's ID</th>
            <th>Patient's Name</th>
            <th>Patient's Age</th>
            <th>Comment</th>
            <th>Doctor's Name</th>
        </tr>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getInt(2) %></td>
            <td><%= nrs.getString("patient") %></td>
            <td><%= nrs.getInt("age") %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
        </tr>
    </table>
<%		}
        } else {
            out.println("<script>alert('No comment found for this Patient ID');</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>
