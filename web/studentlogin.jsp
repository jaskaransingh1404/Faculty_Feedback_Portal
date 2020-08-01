<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
try
{
        String str, str1,str2,str3, sid, password,semester,stuname ;	
        sid=request.getParameter("sid");
	password=request.getParameter("PASSWORD");
        semester=request.getParameter("semester");
        str3="ACTIVE";
        
	Class.forName("com.mysql.jdbc.Driver");
 	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
	Statement s =c.createStatement();
	String sql = "select * from student where sid='"+sid+"'and status='"+str3+"'";
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		str=rs.getString("sid");	
		str1=rs.getString("password");
                str2=rs.getString("semester");
                stuname=rs.getString("name");
                session.setAttribute("studentname", stuname);
                session.setAttribute("stsid", sid);
		if(sid.compareTo(str)==0 && password.compareTo(str1)==0 && semester.compareTo(str2)==0)
		{
			response.sendRedirect("studenthome.jsp");
		}
		else
		{
			out.println("SID and password incorrect.");		
		}
	}

}catch(Exception e ){}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STUDENT LOGIN</title>
<script language="javascript" >
function fun3()
{
	var sid=document.studentlogin.sid.value;
	var pass=document.studentlogin.PASSWORD.value;
        var semester=document.studentlogin.semester.value;
	if(sid =="" || pass =="" || semester=="")
	{
			alert("All the fields are mandatory.");
			document.studentlogin.sid.focus();
			return false;
	}
}
</script>
<link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="style_1.css" type="text/css"/>

	<script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<form name="studentlogin" action="studentlogin.jsp" onsubmit="return fun3()" method=post>
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
   <section>
        <br>
        <br>
        <br>
       
                   
  <center>         
    <h2>STUDENT LOGIN</h2>
<table border="0" cellspacing=0 cellpadding=5 >
<caption align=bottom>
<input type="SUBMIT" value=SUBMIT>
</caption>
<tr>
	<th>SID :</th>
	<td><input name="sid" value="" type=text size="20"></td>
</tr>
<tr>
	<th>PASSWORD :</th>
	<td><input name="PASSWORD" value="" type=password size="20"></td>
</tr>
<tr>
	<th>SEMESTER :</th>
	<td><input name="semester" value="" type=text size="20"></td>
</tr>
</table>
<br><br><br>
</center>
</form>
</body>
</html>