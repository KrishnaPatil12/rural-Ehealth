<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.Dbconnection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<title>Add Aarogya vibhag</title>
<style>
    body {
        background: #e4f1ff;
        font-family: "Poppins", sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .form-box {
        background: #b7ecff69;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        width: 350px;
    }

    .form-box h2 {
        text-align: center;
        margin-bottom: 20px;
        margin-top: 0;
    }

    label {
        font-size: 16px;
        display: block;
        margin-bottom: 5px;
    }

    input {
        width: 100%;
        padding: 8px 10px;
        margin-bottom: 15px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-family: "Poppins", sans-serif;
        font-size: 16px;
    }

    button {
        padding: 10px 20px;
        background-color: #658fb9;
        color: white;
        border: none;
        border-radius: 15px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    button:hover {
        background-color: #153049;
    }
</style>
</head>
<body>
    <div class="form-box">
        <form action="addv.jsp" method="post">
            <h2>Add aarogya vibhag</h2>

            <label>Enter your Name :</label>
            <input type="text" name="name" placeholder="Enter name here">

            <label>Enter your Email :</label>
            <input type="text" name="email" placeholder="Enter email here">

            <label>Enter your Mobile No :</label>
            <input type="text" name="mob" placeholder="Enter mobile number">

            <label>Enter Password :</label>
            <input type="password" name="pass" placeholder="Enter password here">

            <label>Enter your Village :</label>
            <input type="text" name="village" placeholder="Enter village here">

            <label>Enter your District :</label>
            <input type="text" name="district" placeholder="Enter district here">

            <center><button type="submit">Add</button></center>
        </form>
    </div>

<%
int id = 0;
String name = request.getParameter("name");
String email = request.getParameter("email");
String mob = request.getParameter("mob");
String pass = request.getParameter("pass");
String village = request.getParameter("village");
String district = request.getParameter("district");

if(name != null && email != null) { 
    Connection con = Dbconnection.connect();
    try {
        PreparedStatement pstmt = con.prepareStatement("insert into aarogya values (?,?,?,?,?,?,?)");
        pstmt.setInt(1, id);
        pstmt.setString(2, name);   
        pstmt.setString(3, email); 
        pstmt.setString(4, mob);
        pstmt.setString(5, pass);
        pstmt.setString(6, village);
        pstmt.setString(7, district);        

        int i = pstmt.executeUpdate();
        if(i > 0){
            response.sendRedirect("Adashboard.jsp");
        } else {
            out.println("<p style='color:red; text-align:center;'>Check details</p>");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>
