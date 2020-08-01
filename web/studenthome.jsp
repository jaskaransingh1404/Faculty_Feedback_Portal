<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FACULTY FEEDBACK PORTAL</title>
	<link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="style_1.css" type="text/css"/>

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
          <li><a href="studentfeedback.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">Give Feedback</span>
          </a></li>
       
          <li><a href="changestudentpass.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">Change Password</span>
          </a></li>
        <li><a href="contact.jsp">
          <span class="icon"><i class="fas fa-envelope"></i></span>
          <span class="title">Contact Us</span>
          </a></li>
    </ul>
  </div>
    
     <%String stuname1 = session.getAttribute("studentname").toString(); %>
    Welcome <%=stuname1%>   
   


<br><br><br>
</center>
</form>
</body>
<section2>
        <center>
            <img src='logo.png' style='width:30%;height:30%' alt='[]' />
        </center>

    </section2>
</html>