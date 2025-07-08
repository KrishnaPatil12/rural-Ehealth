<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.sql.*" %>
    <%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<title>Add Specialist doctor</title>
<style>
    body {
        background: #e4f1ff;
        font-family: "Poppins", sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height:100vh;
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
        font-size: 14px;
    }

    button {
        padding: 10px 20px;
        background-color:#658fb9;
        color: white;
        border: none;
        border-radius:15px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    button:hover {
        background-color: #153049;
    }
    h2{
    margin-top:0;}
</style>
</head>
<body>
<div class="form-box">
 <form action="Aaddd.jsp">
    <center><h2>Add Specialist doctor</h2></center>

  	<label>Enter your Name :</label>
    <input type="text" name="name"  placeholder="Enter name here">
	<label>Enter your email :</label>
    <input type="text" name="email" placeholder="Enter email here">
    <label>Enter your Mobile No  :</label>
    <input type="text" name="mob" placeholder="Enter mobile number">
    <label>Enter password :</label>
    <input type="password" name="pass" placeholder="Enter password here">
    <label>Enter your city  :</label>
    <input type="text" name="city" placeholder="Enter city here">
    <label>Enter your Specialization  :</label>
    <input type="text" name="spec" placeholder="Enter specialization here">
    <label>Enter Diseased Treat  :</label>
    <input type="text" name="disease" placeholder="Enter Diseased Treat">

    <center><button type="submit">Add</button></center>
  </form>
  </div>
  <%
int id=0;
String name=request.getParameter("name");
String email=request.getParameter("email");
String mob=request.getParameter("mob");
String pass=request.getParameter("pass");
String city=request.getParameter("city");
String spec=request.getParameter("spec");
String disease=request.getParameter("disease");
Connection con=Dbconnection.connect();
try{
	PreparedStatement pstmt=con.prepareStatement("insert into doctor values (?,?,?,?,?,?,?,?)");
	pstmt.setInt(1,id);
	pstmt.setString(2,name);   
	pstmt.setString(3,email); 
	pstmt.setString(4,mob);
	pstmt.setString(5,pass);
	pstmt.setString(6,city);
	pstmt.setString(7,spec);
	pstmt.setString(8,disease);        
	int i=pstmt.executeUpdate();
	if(i>0){
		out.println("Registered Successfully !!");
		response.sendRedirect("Adashboard.jsp");
	}
	else{
		out.println("Check details");
	}
}catch(Exception e){
	e.printStackTrace();
}


%>
</body>
</html>