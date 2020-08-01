<%@page import="java.io.File"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ALL FACULTY REPORT</title>
	<link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="style_1.css" type="text/css"/>

	<script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%
    {  
        float sum=0,feed1=0,feed2=0,feed3=0,feed4=0,feed5=0,feed6=0,feed7=0,feed8=0,feed9=0,feed10=0,feed11=0,feed12=0,avg=0;
       int flag=0,ct=0,sno=0;
       
        String sql,sql1,sql2,sql3,teacher;
        
        Class.forName("com.mysql.jdbc.Driver");
 	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
	Statement s =c.createStatement();
        File file = new File("log.txt");
        FileWriter fstream = new FileWriter(file);
BufferedWriter out1 = new BufferedWriter(fstream);
        
        sql="select eid,sum(feed1),sum(feed2),sum(feed3),sum(feed4),sum(feed5),sum(feed6),sum(feed7),sum(feed8),sum(feed9),sum(feed10),sum(feed11),sum(feed12),count(*) as ct from feedback group by eid order by eid  ";
        ResultSet rs=s.executeQuery(sql);
       %>
      
</head>
<body>

<form name="allfacultyreport" action="allfacultyreport.jsp" onSubmit="return fun1()" method="post">
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
    <section>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
                   
  <center>         
    <h2>ALL FACULTY REPORT</h2>
    <br>
    <br>

    <right>
<table border="1">
<tr><th width="40px" >S.No</th><th width="50px">EID</th><th width="40px" >Ist</th><th width="40px" >2nd</th><th width="40px" >3rd</th><th width="40px" >4th</th><th width="40px" >5th</th><th width="40px" >6th</th><th width="40px" >7th</th><th width="40px" >8th</th><th width="40px" >9th</th><th width="40px" >10th</th><th width="40px" >11th</th><th width="40px" >12th</th><th width="40px" >Count</th><th width="40px" >Avg</th></tr>
        <% while(rs.next()){

        out.write(rs.getString("EID") + ", ");

        out.newLine();
        /*out.write(System.getProperty("line.separator"));*/
}
System.out.println("Completed writing into text file");
out1.close();%>




<%feed1=rs.getInt(2);%>
<%feed2=rs.getInt(3);%>
<%feed3=rs.getInt(4);%>
<%feed4=rs.getInt(5);%>
<%feed5=rs.getInt(6);%>
<%feed6=rs.getInt(7);%>
<%feed7=rs.getInt(8);%>
<%feed8=rs.getInt(9);%>
<%feed9=rs.getInt(10);%>
<%feed10=rs.getInt(11);%>
<%feed11=rs.getInt(12);%>
<%feed12=rs.getInt(13);%>
<%flag=rs.getInt(14);%>
<%sum= feed1+feed2+feed3+feed4+feed5+feed6+feed7+feed8+feed9+feed10+feed11+feed12;%>
<%avg= sum/(12*flag);%>

<tr><td align="center"><%=rs.getRow()%></td>
<td align="center"><%=rs.getString(1)%></td>
<td align="center"><%=rs.getString(2)%></td>
<td align="center"><%=rs.getString(3)%></td>
<td align="center"><%=rs.getString(4)%></td>
<td align="center"><%=rs.getString(5)%></td>
<td align="center"><%=rs.getString(6)%></td>
<td align="center"><%=rs.getString(7)%></td>
<td align="center"><%=rs.getString(8)%></td>
<td align="center"><%=rs.getString(9)%></td>
<td align="center"><%=rs.getString(10)%></td>
<td align="center"><%=rs.getString(11)%></td>
<td align="center"><%=rs.getString(12)%></td>
<td align="center"><%=rs.getString(13)%></td>
<td align="center"><%=rs.getString(14)%></td>

<td align="center"><%=avg%></td>
</tr>
<%
}
%>
<%
}

%>
</table>
</right>
                                    </center>
</form>
</body>
</html>