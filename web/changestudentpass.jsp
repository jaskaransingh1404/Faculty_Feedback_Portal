<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Student Password Change</title>
	<link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="style_1.css" type="text/css"/>

	<script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script language="javascript" >
function fun3()
{
	var name=document.changespassword.uname.value;
	var pass=document.changespassword.passwd.value;
	var pass2=document.changespassword.passwd2.value;
	var pass1=document.changespassword.passwd1.value;
	if(name =="" || pass == "" || pass1 == "" || pass2 == "")
	{
			alert("All the fields are mandatory");
			document.changespassword.uname.focus();
			return false;
	}
}
</script>
</head>

<form name="changespassword" onsubmit="return fun3()">
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
    <section>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
                   <center>
           
    <h2>CHANGE STUDENT PASSWORD </h2>

 </center>
<table width="50%" border="0" align="center" cellpadding="5" cellspacing="5"> 
<tr>
<th align=left>UserName :</th><td align=left><input type=text name=uname size=37></td>
</tr>
<tr>
<th align=left>Old Password :</th><td align=left><input type=password name=passwd size=37></td>
</tr>
<tr>
<th align=left>New Password :</th><td align=left><input type=password name=passwd2 size=37></td>
</tr>
<tr>
<th align=left>Confirm Password :</th><td align=left><input type=password name=passwd1 size=37></td>
</tr>
<tr>
	<th colspan=0 align=right><input type="RESET" value=RESET></th>
	<th colspan=0 align=left><input type="SUBMIT" value=SUBMIT></th>
</tr>
</table>
</center>
<%
try{
	String str,str1,str2,str3,str4,str5,sql;
	int flag=0, flag1=0;
	str1=request.getParameter("uname");
	str2=request.getParameter("passwd");
	str3=request.getParameter("passwd2");
	str4=request.getParameter("passwd1");
	if(str3.compareTo(str4)==0)
	{
		Class.forName("com.mysql.jdbc.Driver");
        Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
        Statement s =c.createStatement();
		sql = "select * from student where SID="+str1+"";
		ResultSet rs=s.executeQuery(sql);
		while(rs.next())
		{
			str=rs.getString("SID");	
			str5=rs.getString("password");
			if(str1.compareTo(str)==0)
			{
				flag=1;
				if(str2.compareTo(str5)==0)
				{
					flag1=1;	
				}
				break;
			}
			
		}
		if(flag==1 && flag1==1)
		{
			sql = "update student set password='"+str3+"' where SID='"+str1+"'";
			s.execute(sql);
			%><jsp:forward page="studenthome.jsp"/> <%
		}
		else if(flag==0)
		{
			out.println("No Entry Found For This User Name");
		}
		else if(flag1==0)
		{
			out.println("Old password not correct.");
		}
	}
	else
	{
		out.println("New Password and Confirmation password not same.");
	}
}catch(Exception e ){}
%>
</form>
</body>
</html>
