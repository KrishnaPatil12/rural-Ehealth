<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor - Dashboard</title>
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
  background: #b7ecff69;
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
  transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
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
    <h2>Doctor's Controls</h2>
    <a href="Dcomment.jsp">Add Comment</a>
    <a href="Dpresc.jsp">Add Prescription</a>
  </div>
</body>
</html>
