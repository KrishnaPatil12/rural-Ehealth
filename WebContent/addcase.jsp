<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Patient Case</title>

<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
    body {
        background: #e4f1ff;
        font-family: "Poppins", "Montserrat", sans-serif;
        display: flex;
        flex-direction:column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }

    .form-box {
        background: #b7ecff69;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        width: 400px;
    }

    h2 {
        text-align: center;
        margin-top: 0;
        color: #153049;
    }

    label {
        font-size: 15px;
        display: block;
        margin-bottom: 5px;
    }

    input, select {
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
</style>
</head>
<body>

<div class="form-box">
    <form method="post">
        <h2>Add Patient Case</h2>

        <label>Enter Patient's name:</label>
        <input type="text" name="patient" placeholder="Patient name here">

        <label>Enter Patient's age:</label>
        <input type="number" name="age" placeholder="Patient age here">

        <label>Enter Patient's gender:</label>
        <input type="text" name="gender" placeholder="Patient gender here">

        <label>Enter Patient's address:</label>
        <input type="text" name="address" placeholder="Patient address here">

        <label>Enter Patient's mobile no:</label>
        <input type="text" name="mob" placeholder="Mobile no here">

        <label>Enter symptom 1:</label>
        <select name="symptom1">
            <option value="">--Select--</option>
            <%
            Connection con = Dbconnection.connect();
            try {
                PreparedStatement pstmt1 = con.prepareStatement("SELECT symptom1 FROM dataset");
                ResultSet rs = pstmt1.executeQuery();
                while (rs.next()) {
            %>
                <option><%= rs.getString("symptom1") %></option>
            <%
                }
            %>
        </select>

        <label>Enter symptom 2:</label>
        <select name="symptom2">
            <option value="">--Select--</option>
            <%
                PreparedStatement pstmt2 = con.prepareStatement("SELECT symptom2 FROM dataset");
                rs = pstmt2.executeQuery();
                while (rs.next()) {
            %>
                <option><%= rs.getString("symptom2") %></option>
            <%
                }
            %>
        </select>

        <label>Enter symptom 3:</label>
        <select name="symptom3">
            <option value="">--Select--</option>
            <%
                PreparedStatement pstmt3 = con.prepareStatement("SELECT symptom3 FROM dataset");
                rs = pstmt3.executeQuery();
                while (rs.next()) {
            %>
                <option><%= rs.getString("symptom3") %></option>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </select>

        <button type="submit">ADD</button>
    </form>
</div>

<%
int id = 0;
String name = request.getParameter("patient");
String a = request.getParameter("age");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String mob = request.getParameter("mob");
String symptom1 = request.getParameter("symptom1");
String symptom2 = request.getParameter("symptom2");
String symptom3 = request.getParameter("symptom3");
String diseased_treat = null;
String doctor_name = null;

if (a != null) {
    try {
        PreparedStatement dpstmt = con.prepareStatement(
            "SELECT diseased_treat FROM dataset WHERE symptom1 = ? OR symptom2 = ? OR symptom3 = ? LIMIT 1");
        dpstmt.setString(1, symptom1);
        dpstmt.setString(2, symptom2);
        dpstmt.setString(3, symptom3);
        ResultSet drs = dpstmt.executeQuery();
        if (drs.next()) {
            diseased_treat = drs.getString("diseased_treat");
        }
        drs.close();

        if (diseased_treat != null) {
            PreparedStatement doctorStmt = con.prepareStatement("SELECT name FROM doctor WHERE diseased_treat = ? LIMIT 1");
            doctorStmt.setString(1, diseased_treat);
            ResultSet doctorRs = doctorStmt.executeQuery();
            if (doctorRs.next()) {
                doctor_name = doctorRs.getString("name");
            }
            doctorRs.close();
            doctorStmt.close();
        }

        int age = Integer.parseInt(a);
        PreparedStatement pstmt = con.prepareStatement("INSERT INTO addcase VALUES (?,?,?,?,?,?,?,?,?,?,?)");
        pstmt.setInt(1, id);
        pstmt.setString(2, name);
        pstmt.setInt(3, age);
        pstmt.setString(4, gender);
        pstmt.setString(5, address);
        pstmt.setString(6, mob);
        pstmt.setString(7, symptom1);
        pstmt.setString(8, symptom2);
        pstmt.setString(9, symptom3);
        pstmt.setString(10, diseased_treat);
        pstmt.setString(11, doctor_name);
        int i = pstmt.executeUpdate();

        if (i > 0) {
        	out.println("<script>alert('You have diagnosed disease related to " + diseased_treat + " by these symptoms.\\nYou have assigned doctor: " + doctor_name + "');</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        con.close();
    }
}
%>

</body>
</html>
