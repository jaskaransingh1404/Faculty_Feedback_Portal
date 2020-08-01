<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
Connection c=null;
ResultSet rs=null;
try
{
	int flag=0;
	String sql,sql1;
	String str1,str2,str3,str5,str6;
        str1=request.getParameter("eid");
	str2=request.getParameter("fname");
	str3=request.getParameter("dname");
	str5=request.getParameter("passwd");
       
        String name;
        name=request.getParameter("username");
	if( str1 != null || str2 != null || str3 != null )
	{	
		Class.forName("com.mysql.jdbc.Driver");
                c=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
                Statement s =c.createStatement();
		sql = "select * from teacher";
		rs=(ResultSet) s.executeQuery(sql);
		while(rs.next())
		{
			
			str6=rs.getString("EID");
			//str7=rs.getString("department");	
			if(str1.compareTo(str6)==0 )
			{
				out.println("Faculty with Employee Id "+str6+" is already added.");
				flag=1;
				break;
			}
		}
		if(flag==0)
                   
		{
			sql1 = "insert into teacher values ('"+str2+"','"+str1+"','"+str5+"','"+str3+"')";
			s.execute(sql1);
			%><jsp:forward page="adminhome.html"/> <%
		}
	}
%>
<%}catch(Exception e){}
finally {
if (c != null ){
{
c.close();
}
}
if (rs != null ){
{
rs.close();
}
}
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>FACULTY HOME</title>
	<link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="style_1.css" type="text/css"/>

	<script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
    <form name="facultyhome" action="facultyhome.jsp" method="POST"  >
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
            <li><a href="changeteacherpass.jsp">
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
        <center>
        <img src="logo.png" width="500" height="500">
        </center>
    </section>
    </form>	
</body>
</html>