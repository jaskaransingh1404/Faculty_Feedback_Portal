<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>FACULTY FEEDBACK PORTAL</title>
	<link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="style_1.css" type="text/css"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	<script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
    <input type="checkbox" id="check">
    <label for="check">
        <i class="fas fa-bars" id="btn"></i>
        <i class="fas fa-times" id="cancel"></i>
    </label>
  <div class="sidebar">
      <header>Dashboard</header>
      <ul>
          <li><a href="index.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">Home</span>
          </a></li>
          <li><a href="addnewfaculty.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">Add Faculty</span>
          </a></li>
          <li><a href="removefaculty.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">Remove Faculty</span>
          </a></li>
          <li><a href="facultyreport.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">Faculty Report</span>
          </a></li>
          <li><a href="allfacultyreport.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">All Faculty Report</span>
          </a></li>
          <li><a href="changeadminpass.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">Change Password</span>
          </a></li>
        <li><a href="contact.jsp">
          <span class="icon"><i class="fas fa-envelope"></i></span>
          <span class="title">Contact Us</span>
          </a></li>
    </ul>
  </div>
	
</body>
    <section2>
        <center>
            <img src='logo.png' style='width:30%;height:30%' alt='[]' />
        </center>

    </section2>
</html>