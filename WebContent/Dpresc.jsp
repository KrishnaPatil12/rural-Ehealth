<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Prescription Entry</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: #e4f1ff;
            font-family: "Poppins", "Montserrat", sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .wrapper {
            margin-top: 40px;
            background: #b7ecff69;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 900px;
        }

        .search-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .search-section label {
            font-size: 18px;
            color: #1f4061;
            font-weight: 600;
            display: block;
            margin-bottom: 10px;
        }

        .search-section input {
            padding: 10px 15px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            width: 60%;
            max-width: 300px;
        }

        .search-section button {
            margin-top: 15px;
            padding: 10px 25px;
            background-color: #658fb9;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .search-section button:hover {
            background-color: #153049;
        }

        h2, h3 {
            color: #153049;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid white;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #658fb9;
            color: white;
        }

        .prescription-form label {
            font-weight: 500;
            display: block;
            margin-top: 15px;
            color: #1f4061;
        }

        .prescription-form input,
        .prescription-form textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            font-family: "Poppins", sans-serif;
        }

        .prescription-form button {
            background-color: #658fb9;
            color: white;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .prescription-form button:hover {
            background-color: #153049;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="search-section">
        <form method="get" action="Dpresc.jsp">
            <label>Enter Patient ID:</label>
            <input type="number" name="patient_id" required>
            <br>
            <button type="submit">Search</button>
        </form>
    </div>

<%
Connection con = Dbconnection.connect();
String i = request.getParameter("patient_id");
if (i != null) {
    int id = Integer.parseInt(i);
    try {
        PreparedStatement Apstmt = con.prepareStatement("SELECT * FROM addcase WHERE id = ?");
        Apstmt.setInt(1, id);
        ResultSet rs = Apstmt.executeQuery();

        if (rs.next()) {
            String assignedDoctor = rs.getString(11); // doctor assigned from DB
            String loggedDoctor = GetSet.getName();   // doctor from session

            if (assignedDoctor.equalsIgnoreCase(loggedDoctor)) {
%>
<div style="display: flex; align-items: center; justify-content: center; margin: 40px 0;">
  <span style="flex: 1; border-top: 2px dashed #658fb9;"></span>
  <h2 style="padding: 0 15px; color: #1f4061; font-weight: bold; font-size: 22px; white-space: nowrap; margin: 0;">
    Patient's Details</h2>
  <span style="flex: 1; border-top: 2px dashed #658fb9;"></span>
</div>

<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Address</th>
        <th>Mobile</th>
        <th>Diseased Treat</th>
        <th>Doctor Name</th>
    </tr>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getInt(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(6) %></td>
        <td><%= rs.getString(10) %></td>
        <td><%= rs.getString(11) %></td>
    </tr>
</table>

<div style="display: flex; align-items: center; justify-content: center; margin: 40px 0;">
  <span style="flex: 1; border-top: 2px dashed #658fb9;"></span>
  <span style="padding: 0 15px; color: #1f4061; font-weight: bold; font-size: 18px; white-space: nowrap;">Prescription Form</span>
  <span style="flex: 1; border-top: 2px dashed #658fb9;"></span>
</div>

<form class="prescription-form" action="Dpresc.jsp">
    <label>Patient's ID:</label>
    <input type="text" name="patient_id" value="<%= rs.getInt(1) %>" readonly>

    <label>Date:</label>
    <input type="date" name="date" required>

    <label>Diagnosis:</label>
    <input type="text" name="diagnosis" placeholder="e.g. Viral fever">

    <label>Medicines (List all medicines):</label>
    <textarea name="medicines" rows="5" placeholder="1. Paracetamol 500mg - Twice a day - 5 days&#10;2. ORS - After loose motion"></textarea>

    <label>Frequency:</label>
    <input type="text" name="frequency" placeholder="e.g. 5 days">

    <label>Food Instructions:</label>
    <input type="text" name="food_instruction" placeholder="e.g. After food">

    <center><button type="submit">Save Prescription</button></center>
</form>
<%
            } else {
                out.println("<p class='message' style='color:red;'>You are not authorized to prescribe for this patient.</p>");
            }
        } else {
            out.println("<p class='message' style='color:red;'>No patient found with this ID.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<%
try {
    String pId = request.getParameter("patient_id");
    String date = request.getParameter("date");
    String diagnosis = request.getParameter("diagnosis");
    String medicine = request.getParameter("medicines");
    String frequency = request.getParameter("frequency");
    String food = request.getParameter("food_instruction");
    String doctor = GetSet.getName();

    if (pId != null && date != null) {
        int patientId = Integer.parseInt(pId);
        int id = 0;

        PreparedStatement ps = con.prepareStatement("INSERT INTO dr_spec VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        ps.setInt(1, id);
        ps.setInt(2, patientId);
        ps.setString(3, date);
        ps.setString(4, diagnosis);
        ps.setString(5, medicine);
        ps.setString(6, frequency);
        ps.setString(7, food);
        ps.setString(8, doctor);

        int inserted = ps.executeUpdate();
        if (inserted > 0) {
            out.println("<p class='message' style='color:green;'>Prescription saved successfully!</p>");
        }
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
</div>
</body>
</html>
