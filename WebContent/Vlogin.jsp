<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<title>Aarogya Vibhag Login</title>
<style>
    body {
        background: #e4f1ff;
        font-family: "Poppins", "Montserrat", sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        height: 100vh;
        justify-content: center;
        align-items: center;
    }

    .form-box {
        background: #b7ecff69;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        width: 350px;
    }

    .form-box h2 {
        text-align: center;
        margin-bottom: 20px;
        margin-top: 0;
        color: #153049;
    }

    label {
        font-size: 16px;
        display: block;
        margin-bottom: 6px;
    }

    input {
        width: 100%;
        padding: 8px 10px;
        margin-bottom: 15px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 15px;
        font-family: "Poppins", "Montserrat", sans-serif;
    }

    button {
        width: 100%;
        padding: 10px 20px;
        background-color: #658fb9;
        color: white;
        border: none;
        border-radius: 15px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease;
        font-family: "Poppins", "Montserrat", sans-serif;
    }

    button:hover {
        background-color: #153049;
    }
</style>
</head>
<body>

<div class="form-box">
    <form method="post">
        <h2>Sign in</h2>
        <label>Enter your email:</label>
        <input type="text" name="email" placeholder="Email here">

        <label>Enter your password:</label>
        <input type="password" name="pass" placeholder="Password here">

        <button type="submit">Sign in</button>
    </form>
</div>

<%
String email = request.getParameter("email");
String pass = request.getParameter("pass");

if (email != null && pass != null) {
    Connection con = Dbconnection.connect();
    try {
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM aarogya WHERE email=? AND password=?");
        pstmt.setString(1, email);
        pstmt.setString(2, pass);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            response.sendRedirect("Aadashboard.jsp");
        } else {
%>
            <script>alert("Invalid email or password.");</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>
