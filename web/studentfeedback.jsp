<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
    {  
        String sql,sql1,sql2,sql3;
        Class.forName("com.mysql.jdbc.Driver");
 	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
	Statement s =c.createStatement();
        String sessstsid = session.getAttribute("stsid").toString();
        sql="select SID,EID,Course_id from facultystudentmapping where sid='"+sessstsid+"' and feedbackflag<>'Y'";
        String str5=request.getParameter("A");
        String str7=request.getParameter("B");
        String str8=request.getParameter("C");
        String str9=request.getParameter("D");
        String str10=request.getParameter("E");
        String str11=request.getParameter("F");
        String str12=request.getParameter("G");
        String str13=request.getParameter("H");
        String str14=request.getParameter("I");
        String str15=request.getParameter("J");
        String str16=request.getParameter("K");
        String str17=request.getParameter("L");
        String str18=request.getParameter("M");
        String str19=request.getParameter("N");
       
        String str6=request.getParameter("teacher");
       
        sql1="update facultystudentmapping set feedbackflag='Y' where sid='"+sessstsid+"' and eid='"+str6+"' ";
        sql2="insert into feedback values ('"+str6+"','"+str5+"','"+str7+"','"+str8+"','"+str9+"','"+str10+"','"+str11+"','"+str12+"','"+str13+"','"+str14+"','"+str15+"','"+str16+"','"+str17+"','"+str18+"','"+str19+"')";
        sql3="delete from feedback where EID='null'";
        ResultSet rs=s.executeQuery(sql);
       %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STUDENT FEEDBACK</title>
</head>
<body>
<form name="studentfeedback" action ="studentfeedback.jsp"  method="post">
   
    <script>
function myFunction() {
  var value = document.getElementById("teacher").value;
  console.log(value);
}
</script>
              <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="style_1.css" type="text/css"/>

	<script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
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
        <li><a href="studentlogin.jsp">
          <span class="icon"><i class="fas fa-stream"></i></span>
          <span class="title">Login</span>
          </a></li>
        <li><a href="contact.jsp">
          <span class="icon"><i class="fas fa-envelope"></i></span>
          <span class="title">Contact Us</span>
          </a></li>
    </ul>
  </div>
 <center><h3><u>STUDENT FEEDBACK</u></h3></center>
<center>
    <h3>Please give your answer about the following question by selecting any one grade on the scale:</h3>


<button type="button" style="font-size:7pt;color:white;background-color:green;border:2px solid #336600;padding:3px">Strongly Agree 5</button>
<button type="button" style="font-size:7pt;color:white;background-color:limegreen;border:2px solid #336600;padding:3px">Agree 4</button>
<button type="button" style="font-size:7pt;color:white;background-color:lightskyblue;border:2px solid #336600;padding:3px">Neutral 3</button>
<button type="button" style="font-size:7pt;color:white;background-color:lightsalmon;border:2px solid #336600;padding:3px"> Disagree 2</button>
<button type="button" style="font-size:7pt;color:white;background-color:darkred;border:2px solid #336600;padding:3px">Strongly Disagree 1</button><br>
</center>
<table border="0" cellspacing="0" cellpadding=10 >
    <center>
        <table align="center" border="1" cellspacing="0" cellpadding=10>
<tr>      

<br>
     
<th>
            Select the subject :    
        <td><select name ="teacher" class="form-control" onchange="myFunction()">
                                    <%while(rs.next()){ %>
                                    <option value="<%=rs.getString(2)%>"><%=rs.getString(2) + "-" + rs.getString(3) %></option>
                                    
                                    <%  } %>
                                    </select> 
        </td>                           
        </th>
</table>
</center>                                    


                                    <center>
                                    <br>
                                    <table border="1" cellspacing="0" cellpadding=3>
<th>1-Course Material</th>

<tr>
<td><b>1:</b> Teacher provided the course outline having weekly content plan with list of  required text book:</td>  
<td><input type="radio" name="A" value="5" required> 5
  <input type="radio" name="A" value="4">4
  <input type="radio" name="A" value="3"> 3
<input type="radio" name=" A" value="2">2
<input type="radio" name="A" value="1">1</td>
</tr>
  
<tr>
<td><b>2:</b> Course objectives,learning outcomes and grading criteria are clear to me:</td> 
<td><input type="radio" name="B" value="5" required> 5
  <input type="radio" name="B" value="4">4
  <input type="radio" name="B" value="3"> 3
<input type="radio" name=" B" value="2">2
<input type="radio" name="B" value="1">1</td>
</tr>

<tr>
<td>
<b>3:</b> Course integrates theoretical course concepts with the real world examples:</td> 
<td>
<input type="radio" name="C" value="5" required> 5
  <input type="radio" name="C" value="4">4
  <input type="radio" name="C" value="3"> 3
<input type="radio" name="C" value="2">2
<input type="radio" name="C" value="1">1</td>
</tr>
</table>
                                    <br>
<table border="1" cellspacing="0" cellpadding=3>
<th>2-Class Teaching</th>
 <tr>
<td><b>4:</b> Teacher is punctual,arrives on time and leaves on time:               </td>
<td> <input type="radio" name="D" value="5" required> 5
  <input type="radio" name="D" value="4">4
  <input type="radio" name="D" value="3"> 3
<input type="radio" name="D" value="2">2
<input type="radio" name="D" value="1">1
</td>

<tr>
<td>
<b>5:</b> Teacher is good at stimulating the interest in the course content:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td> 
<input type="radio" name="E" value="5" required> 5
<input type="radio" name="E" value="4">4
  <input type="radio" name="E" value="3"> 3
<input type="radio" name="E" value="2">2
<input type="radio" name="E" value="1">1</td>
</tr>
<tr>
<td><b>6:</b> Teacher is good at explaining the subject matter:</td>
<td>
 <input type="radio" name="F" value="5" required> 5
  <input type="radio" name="F" value="4">4
  <input type="radio" name="F" value="3"> 3
<input type="radio" name=" F" value="2">2
<input type="radio" name="F" value="1">1</td>
</tr>

<tr><td>
<b>7:</b> Teacher's presentation was clear,loud ad easy to understand:</td>
<td> <input type="radio" name="G" value="5" required> 5
  <input type="radio" name="G" value="4">4
  <input type="radio" name="G" value="3"> 3
<input type="radio" name="G" value="2">2
<input type="radio" name="G" value="1">1</td>
<tr>
<td>
<b>8:</b> Teacher is good at using innovative teaching methods/ways:</td><td> 
<input type="radio" name="H" value="5" required> 5
  <input type="radio" name="H" value="4">4
  <input type="radio" name="H" value="3"> 3
<input type="radio" name="H" value="2">2
<input type="radio" name="H" value="1">1</td>
</tr>
<tr>
<td>
<b>9:</b> Teacher is available and helpful during counseling hours:</td> 
<td><input type="radio" name="I" value="5" required> 5
  <input type="radio" name="I" value="4">4
  <input type="radio" name="I" value="3"> 3
<input type="radio" name="I" value="2">2
<input type="radio" name="I" value="1">1</td>
</tr>
<tr>
<td>
<b>10:</b> Teacher has competed the whole course as per course outline:</td>
<td>
 <input type="radio" name="J" value="5" required> 5
  <input type="radio" name="J" value="4">4
  <input type="radio" name="J" value="3"> 3
<input type="radio" name="J" value="2">2
<input type="radio" name="J" value="1">1</td>
</tr>
</table>
                                    <br>
<table border="1" cellspacing="0" cellpadding=3>
<th>3-Class Assessment</th>

<tr>
<td><b>11:</b>Teacher was always fair and impartial:</td>
<td>
 <input type="radio" name="K" value="5" required> 5
  <input type="radio" name="K" value="4">4
  <input type="radio" name="K" value="3"> 3
<input type="radio" name="K" value="2">2
<input type="radio" name="K" value="1">1</td>
</tr>
<tr>
<td><b>12:</b>Assessments conducted are clearly connected to maximize learning objectives:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<Td>
 <input type="radio" name="L" value="5" required> 5
  <input type="radio" name="L" value="4">4
  <input type="radio" name="L" value="3"> 3
<input type="radio" name="L" value="2">2
<input type="radio" name="L" value="1">1</td>
</tr>
</table>
                                    <br>
<b>13:</b>What I liked about the course:(Not more then 25 words)<br><br>
<center>
<textarea name="M" rows="4" cols="91" id="comments" style="font-family:sans-serif;font-size:1.2em;">

</textarea></center><br>
<b>14:</b>Why I disliked about the course:(Not more then 25 words)<br><br>
<center>
<textarea name="N" rows="4" cols="91" id="comments" style="font-family:sans-serif;font-size:1.2em;">

</textarea></center>




<%s.execute(sql1); %>

<%s.execute(sql2); %>
<%s.execute(sql3); %>

 <%  } %>

 
<table border="0" cellspacing=5 cellpadding=10 >
<tr>
	<td colspan=2 align=center><input type="reset" value="RESET"></td>
	<td colspan=2 align=center><input type="SUBMIT" value=SUBMIT></td>
</tr>
</table>
 </center>
</form>
</body>
</html>