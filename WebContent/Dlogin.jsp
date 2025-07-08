<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Login</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    body {
        background: #c1dfffa6;
        font-family: "Poppins", "Montserrat", sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 90vh;
        margin: 0;
    }

    .form-box {
        background: #b7ecff69;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        width: 350px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #153049;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-size: 15px;
        color: #1f4061;
    }

    input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-family: "Poppins", sans-serif;
        font-size: 15px;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #658fb9;
        color: white;
        border: none;
        border-radius: 10px;
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
        <h2>Doctor's Login</h2>
        <form action="Dlogin.jsp">
            <label>Enter your Name :</label>
            <input type="text" name="name" placeholder="Name here">

            <label>Enter your Email :</label>
            <input type="text" name="email" placeholder="Email here">

            <label>Enter your Password :</label>
            <input type="password" name="pass" placeholder="Password here">

            <button type="submit">Sign in</button>
        </form>
    </div>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String pass = request.getParameter("pass");

if (email != null && pass != null) {
	GetSet.setName(name);
    Connection con = Dbconnection.connect();
    try {
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM doctor WHERE email=? AND password=?");
        pstmt.setString(1, email);
        pstmt.setString(2, pass);
        GetSet.setName(name);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            response.sendRedirect("Ddashboard.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
</body>
</html>
