<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rural.health.Dbconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prescription Viewer</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<!-- jsPDF + html2canvas -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<style>
    body {
        background: #e4f1ff;
        font-family: "Poppins", "Montserrat", sans-serif;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 50px;
    }

    .form-box {
        background: #b7ecff69;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        width: 400px;
        margin-bottom: 30px;
    }

    h2 {
        text-align: center;
        color: #153049;
        margin-top: 0;
    }

    label {
        font-size: 15px;
        display: block;
        margin-bottom: 5px;
    }

    input {
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

    table {
        border-collapse: collapse;
        margin-top: 20px;
        width: 90%;
        max-width: 1000px;
        font-size: 15px;
    }

    th, td {
        padding: 12px 15px;
        border: 1px solid #ccc;
        text-align: center;
        background-color: #ffffff;
    }

    th {
        background-color: #d9efff;
    }

    .download-btn {
        margin-top: 15px;
        width: auto;
        padding: 10px 20px;
    }

</style>
</head>
<body>

<div class="form-box">
    <form method="post">
        <h2>View Prescription by Patient ID</h2>
        <label>Enter patient's ID:</label>
        <input type="number" name="pId" placeholder="Patient's ID">
        <button type="submit">View Prescription</button>
    </form>
</div>

<%
Connection con = Dbconnection.connect();
String id = request.getParameter("pId");

if (id != null) {
    try {
        int pid = Integer.parseInt(id);
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM dr_spec WHERE patient_id=?");
        pstmt.setInt(1, pid);
        ResultSet rs = pstmt.executeQuery();

        PreparedStatement npstmt = con.prepareStatement("SELECT * FROM addcase WHERE id=?");
        npstmt.setInt(1, pid);
        ResultSet nrs = npstmt.executeQuery();

        if (rs.next()) {
            if (nrs.next()) {
%>
    <h2>Patient's Prescription Details</h2>
    <div id="prescription-area">
        <table>
            <tr>
                <th>ID</th>
                <th>Patient's ID</th>
                <th>Patient's Name</th>
                <th>Patient's Age</th>
                <th>Date</th>
                <th>Diagnosis</th>
                <th>Medicine</th>
                <th>Frequency</th>
                <th>Food</th>
                <th>Doctor's Name</th>
            </tr>
            <tr>
                <td><%= rs.getInt(1) %></td>
                <td><%= rs.getInt(2) %></td>
                <td><%= nrs.getString(2) %></td>
                <td><%= nrs.getInt(3) %></td>
                <td><%= rs.getDate(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(8) %></td>
            </tr>
        </table>
    </div>
    <button class="download-btn" onclick="downloadPDF()">Download as PDF</button>
<%
            }
        } else {
            out.println("<script>alert('No prescription found for this Patient ID');</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<script>
    async function downloadPDF() {
        const element = document.getElementById("prescription-area");
        const canvas = await html2canvas(element);
        const imgData = canvas.toDataURL("image/png");

        const { jsPDF } = window.jspdf;
        const pdf = new jsPDF("p", "mm", "a4");

        const pageWidth = pdf.internal.pageSize.getWidth();
        const pageHeight = pdf.internal.pageSize.getHeight();

        const imgWidth = pageWidth - 20;
        const imgHeight = canvas.height * imgWidth / canvas.width;

        pdf.addImage(imgData, "PNG", 10, 10, imgWidth, imgHeight);
        pdf.save("prescription.pdf");
    }
</script>

</body>
</html>
