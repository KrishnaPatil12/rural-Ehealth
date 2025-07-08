<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Prescription Comment</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: #e4f1ff;
            font-family: "Poppins", "Montserrat", sans-serif;
            padding: 40px;
            color: #1f4061;
        }

        .form-container {
            background: #b7ecff69;
            padding: 25px;
            border-radius: 12px;
            max-width: 500px;
            margin: auto;
            margin-top: 40px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: 600;
            font-size: 16px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        button {
            background-color: #658fb9;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #3a556f;
        }

        .divider {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 40px 0 20px 0;
        }

        .divider span {
            flex: 1;
            border-top: 2px dashed #658fb9;
        }

        .divider h2 {
            margin: 0 15px;
            font-size: 22px;
            white-space: nowrap;
        }

        table.white-border {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background: #b7ecff69;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        table.white-border th, table.white-border td {
            border: 1px solid white;
            padding: 10px;
            text-align: center;
        }

        table.white-border th {
            background-color: #658fb9;
            color: white;
        }

        table.white-border tr:hover {
            background-color: #d8f3ff;
        }

        .success {
            color: green;
            text-align: center;
            font-weight: bold;
        }

        .error {
            color: red;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="form-container">
    <form method="get" action="Dcomment.jsp">
        <label>Enter Patient ID:</label>
        <input type="number" name="patient_id" required>
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
            String assignedDoctor = rs.getString("doctor_name"); 
            String loggedDoctor = GetSet.getName();         

            if (assignedDoctor != null && assignedDoctor.equalsIgnoreCase(loggedDoctor)) {
%>
<div class="divider">
    <span></span>
    <h2>Patient Details</h2>
    <span></span>
</div>

<table class="white-border">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Address</th>
        <th>Mobile</th>
        <th>Disease</th>
        <th>Doctor</th>
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

<div class="form-container">
    <form action="Dcomment.jsp" method="get">
        <input type="hidden" name="patient_id" value="<%= rs.getInt(1) %>">
        <label>Comment:</label>
        <textarea name="comment" rows="4" required></textarea>
        <button type="submit">Save Comment</button>
    </form>
</div>
<%
            } else {
                out.println("<p class='error'>You are not authorized to comment for this patient.</p>");
            }
        } else {
            out.println("<p class='error'>No patient found with this ID.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<%
try {
    String pId = request.getParameter("patient_id");
    String comment = request.getParameter("comment");
    String doctor = GetSet.getName();

    if (pId != null && comment != null) {
        int patientId = Integer.parseInt(pId);
        PreparedStatement check = con.prepareStatement("SELECT doctor_name FROM addcase WHERE id = ?");
        check.setInt(1, patientId);
        ResultSet result = check.executeQuery();

        if (result.next()) {
            String assignedDoctor = result.getString("doctor_name");
            if (assignedDoctor != null && assignedDoctor.equalsIgnoreCase(doctor)) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO comment VALUES (?, ?, ?, ?)");
                ps.setInt(1, 0); 
                ps.setInt(2, patientId);
                ps.setString(3, comment);
                ps.setString(4, doctor);

                int inserted = ps.executeUpdate();
                if (inserted > 0) {
                    out.println("<p class='success'>Comment saved successfully!</p>");
                } else {
                    out.println("<p class='error'>Failed to save comment.</p>");
                }
            } else {
                out.println("<p class='error'>Unauthorized: You are not assigned to this patient.</p>");
            }
        }
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
