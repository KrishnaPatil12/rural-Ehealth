<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
body {
  background: #c1dfffa6;
  color: #1f4061;
  font-family: "Poppins", "Montserrat", sans-serif;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 90vh;
  margin: 0;
}

.container {
  background:#b7ecff69;
  padding: 30px 40px;
  border-radius: 15px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
  text-align: center;
}

.container h2 {
  margin-bottom: 25px;
}

.container a {
  display: block;
  margin: 10px 0;
  color: white;
  background: #658fb9;
  text-decoration: none;
  padding: 12px 20px;
  border-radius: 10px;
  font-size: 16px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.container a:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 255, 255, 0.4);
  background: #3a556f;
}
</style>
</head>
<body>
  <div class="container">
    <h2>Admin Controls</h2>
    <a href="addv.jsp"> Add Aarogya Vibhag</a>
    <a href="Aviewv.jsp"> View Aarogya Vibhag</a>
    <a href="Adeletev.jsp"> Delete Aarogya Vibhag</a>
    <a href="Aaddd.jsp"> Add Specialist Doctor</a>
    <a href="Aviewd.jsp"> View Specialist Doctor</a>
    <a href="Adeleted.jsp"> Delete Specialist Doctor</a>
  </div>
</body>
</html>
