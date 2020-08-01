<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INDIVIDUAL FACULTY REPORT</title>
	<link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="style_1.css" type="text/css"/>

	<script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%
    {  
        float sum=0,feed1=0,feed2=0,feed3=0,feed4=0,feed5=0,feed6=0,feed7=0,feed8=0,feed9=0,feed10=0,feed11=0,feed12=0,avg=0;
        int flag=0;
        String sql,sql1,sql2,name;
        Class.forName("com.mysql.jdbc.Driver");
 	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
	Statement s =c.createStatement();
        String str6=request.getParameter("teacher");
        sql="select distinct eid from feedback";
        sql1="select * from feedback where eid='"+str6+"'";
        sql2="select sum(feed1),sum(feed2),sum(feed3),sum(feed4),sum(feed5),sum(feed6),sum(feed7),sum(feed8),sum(feed9),sum(feed10),sum(feed11),sum(feed12) from feedback where eid='"+str6+"'";

        ResultSet rs1=s.executeQuery(sql);
       %>
      
</table>
<script language="javascript" >
        function myFunction() {
        var value = document.getElementById("teacher").value;
        console.log(value);
                              }
</script>


</head>
<body>

<form name="facultyreport" action="facultyreport.jsp" onSubmit="return fun1()" method="post">
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
           
    <h2>INDIVIDUAL FACULTY FEEDBACK REPORT</h2>
    <br>
    <br>

 </center><center>
            <table border="0" cellspacing="0" cellpadding=10 >
            <tr>
            
            <th>Select the Faculty EID :    <td> <select name ="teacher" onchange="myFunction()">
                                    <%while (rs1.next()){ %>
                                    <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)  %></option>
                                    <%  } %>
                                    </select> </td>  </th>                  
            
            </tr>
              <tr>
            <th colspan=2 align=center><input type="RESET" value=RESET></th>
            <th colspan=2 align=center><input type="SUBMIT" value=SUBMIT></th>
            </tr>
            
            <tr>
            <td>
                <%{ResultSet rs=s.executeQuery(sql1);%>
                <%rs.last();%>
                <%flag= rs.getRow();%>
                <%rs.close();}%>
             
                <br>
                No of student given feedback for Eid <%=str6%> is <%=flag%>
                <%ResultSet rs2=s.executeQuery(sql2);%>
                <%if (rs2.next()){%>
                <%feed1= rs2.getInt(1);%>
                <%feed2= rs2.getInt(2);%>
                <%feed3= rs2.getInt(3);%>
                <%feed4= rs2.getInt(4);%>
                <%feed5= rs2.getInt(5);%>
                <%feed6= rs2.getInt(6);%>
                <%feed7= rs2.getInt(7);%>
                <%feed8= rs2.getInt(8);%>
                <%feed9= rs2.getInt(9);%>
                <%feed10= rs2.getInt(10);%>
                <%feed11= rs2.getInt(11);%>
                <%feed12= rs2.getInt(12);%>
                <%sum= feed1+feed2+feed3+feed4+feed5+feed6+feed7+feed8+feed9+feed10+feed11+feed12;%>
                <%avg= sum/(12*flag);%>
            <tr> 
            <td> 
                Average of the <%=str6%> is <%=avg%> 
            </td>  
            </tr>
                <%rs2.close();}%>
                <%}%>
            </td>
            </tr>
          
            </table>
</center>
</form>
</body>
</html>