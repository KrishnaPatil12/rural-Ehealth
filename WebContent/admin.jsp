<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
    <%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Login</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
body{
  background: #c1dfffa6;
  color: #1f4061;
  font-family: "Poppins", "Montserrat", sans-serif;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 90vh;
  margin: 0;
}

.login {
  background: #b7ecff69;
  padding: 20px 30px;
  width: 100%;
  max-width: 300px;
  border-radius: 10px;
  font-size: 18px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

input {
border:none;
  padding: 10px 4px;
  background: #ebf5ff;
  width: 90%;
  font-family: "Poppins", "Montserrat", sans-serif;
  font-size: 14px;
  border-radius: 6px;
  transition: background 0.3s ease, box-shadow 0.3s ease;
}
button {
  border: none;
  border-radius: 15px;
  padding: 10px 20px;
  background: #6dbad1;
  color: white;
  font-family: "Poppins", "Montserrat", sans-serif;
  font-size: 14px;
  cursor: pointer;
  transition: background 0.3s ease, transform 0.3s ease;
}

button:hover {
  background: #4ca8c2;
  transform: scale(1.0);
}

</style>
</head>
<body>
    <div class="login">
    <form action="admin.jsp">
    <h2 align="center">Sign in</h2>
      	<label>Enter your Email :</label><br>
		<input type="text" name="email" placeholder="email here">
		<br><br>
		<label>Enter your Password  :</label><br>
		<input type="password" name="password" placeholder="password here">
		<br><br>
      	<center><button type="submit">Sign in</button></center>
    </form>
    </div>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if("admin@gmail".equals(email) && "admin123".equals(password)) {
	out.println("Login Successful !!");
    response.sendRedirect("Adashboard.jsp");
}
%>
</body>
</html>