<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ page import="java.sql.*" %>
    <%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
Connection con=Dbconnection.connect();
PreparedStatement pstmt=con.prepareStatement("delete from doctor where id=?");
pstmt.setInt(1,id);
int i=pstmt.executeUpdate();
if(i>0){
	response.sendRedirect("Adeleted.jsp");
}

%>
</body>
</html>