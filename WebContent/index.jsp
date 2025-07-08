<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rural E-health Portal</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: #c1dfffa6;
  color: #1f4061;
  font-family: "Poppins", "Montserrat", sans-serif;
  padding: 10px;
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: #87c2d8eb;
  padding: 10px 20px;
  border-radius: 10px;
  margin-bottom: 15px;
}

.header img {
  border-radius: 50%;
}

.header h1 {
  flex: 1;
  font-size: 28px;
  padding-left: 15px;
}

.header a {
  text-decoration: none;
  background-color: #1f4061;
  color: white;
  padding: 8px 16px;
  border-radius: 8px;
  font-size: 14px;
  transition: background 0.3s ease, transform 0.2s ease;
  margin-left: 10px;
}

.header a:hover {
  background-color: #16304b;
  transform: translateY(-2px);
}

/* Tagline Section */
.content {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 40px;
  flex-wrap: wrap;
  padding: 10px 20px;
}

.content img {
  border-radius: 20px;
  width: 760px;
  max-width: 100%;
  object-fit: fill;
}

.tagline {
  max-width: 400px;
  text-align: left;
}

.tagline h2 {
  font-size: 32px;
  font-weight: 600;
  margin-bottom: 10px;
  color: #1f4061;
}

.tagline h3 {
  font-size: 20px;
  font-weight: 400;
  color: #2f4e6b;
  margin-top: 0;
}

.services-section {
  padding: 10px 20px;
  text-align: center;
}

.services-section h2 {
  color: #1f4061;
  font-size: 32px;
  margin-bottom: 30px;
}

.services-cards {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 30px;
}

.service-card {
  background-color:#e6fcff99;
  color: #1f4061;
  width: 260px;
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 200px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.service-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.service-card h3 {
  font-size: 20px;
  margin-bottom: 12px;
}

.service-card p {
  font-size: 14px;
  line-height: 1.6;
  flex-grow: 1;
}

.image-paragraphs {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    gap: 45px;
    padding: 40px 20px;
    flex-wrap: nowrap;
}
.image-heading {
  text-align: center;
  font-size: 32px;
  color: #1f4061;
  margin-top: 60px;
  margin-bottom: 20px;
}


.image-box {
  background-color:#e6fcff99;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  width: 320px;
  height: 460px;
  padding: 20px;
  text-align: center;
  transition: transform 0.3s ease;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.image-box:hover {
  transform: translateY(-5px);
}

.image-box img {
  width: 100%;
  height: 400px; /* fixed height for images */
  object-fit: cover; /* maintain aspect ratio and fill area */
  border-radius: 10px;
  margin-bottom: 15px;
}

.image-box p {
  font-size: 14px;
  color: #1f4061;
  line-height: 1.6;
  flex-grow: 1;
}
.footer {
  background-color:#84b8c4eb;
  color: #1f4061;
  padding: 20px 10px;
  margin-top: 40px;
  text-align: center;
  border-top: 2px solid #1f406133;
  font-size: 14px;
}

.footer-content {
  max-width: 1000px;
  margin: 0 auto;
}

.footer-links {
  margin-top: 10px;
}

.footer-links a {
  color: #1f4061;
  text-decoration: none;
  margin: 0 12px;
  font-weight: 500;
  transition: color 0.3s ease;
}

.footer-links a:hover {
  color: #16304b;
}

</style>
</head>
<body>


<div class="header">
  <img src="health-report.png" width="60" height="60"> 
  <h1>Rural E-health</h1>
  <div>
    <a href="admin.jsp">Admin Login</a>
    <a href="Vlogin.jsp">Aarogya Vibhag Login</a>
    <a href="Dlogin.jsp">Doctor Login</a>
  </div>
</div>


<div class="content">
  <img src="img.jpg" alt="Health Image">
  <div class="tagline">
    <h2>Where Your Health Gets VIP Treatment</h2>
    <h3>Take charge of your health with modern rural e-healthcare solutions that empower, connect, and care.</h3>
  </div>
</div>


<div class="services-section">
  <h2>Our Services</h2>
  <div class="services-cards">
    <div class="service-card">
      <h3>Doctor Consultations</h3>
      <p>Patients can consult with rural health specialists for efficient diagnosis and treatment.</p>
    </div>
    <div class="service-card">
      <h3>Case Management</h3>
      <p>Track, update, and manage health cases through an easy-to-use interface for Aarogya Vibhag.</p>
    </div>
    <div class="service-card">
      <h3>Prescription System</h3>
      <p>Doctors can add digital prescriptions with food and dosage instructions.</p>
    </div>
    <div class="service-card">
      <h3>Reports & Analytics</h3>
      <p>Admins can view real-time health data across districts and make decisions quickly.</p>
    </div>
  </div>
</div>

<h2 class="image-heading">Health at Your Fingertips, in Rural India.</h2>
<div class="image-paragraphs">
  <div class="image-box">
    <img src="h2.jpg" alt="Doctor Consultation">
    <p>Our platform bridges the gap between patients in rural areas and expert doctors. This image represents direct access to care without needing to travel long distances.</p>
  </div>

  <div class="image-box">
    <img src="h1.jpg" alt="Health Monitoring">
    <p>We provide ongoing health monitoring and report generation tools for better treatment planning. This image reflects the digital transformation in rural healthcare services.</p>
  </div>
  
    <div class="image-box">
    <img src="h3.jpg" alt="Health Monitoring">
    <p>Our system securely stores every patient's medical history, diagnosis, and prescriptions. This supports better long-term treatment and continuity of care for rural patients.</p>
  </div>
  
    <div class="image-box">
    <img src="h4.jpg" alt="Health Monitoring">
      <p>Through dedicated Aarogya Vibhag interfaces, health workers can register cases, track recovery, and collaborate with doctors. This image represents real-time rural health coordination.</p>
  </div>
</div>
<footer class="footer">
  <div class="footer-content">
    <p>&copy; 2025 Rural E-health. All rights reserved.</p>
    <div class="footer-links">
      <a href="#">Privacy Policy</a>
      <a href="#">Terms of Use</a>
      <a href="#">Contact</a>
    </div>
  </div>
</footer>
</body>
</html>
