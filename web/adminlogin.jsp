<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
Connection c=null;
ResultSet rs=null;
try
{
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        String str, str1, str2, str3,sessadmin1;
        String t2=new String();	
        str2=request.getParameter("uname");
	str3=request.getParameter("PASSWORD");
     
	Class.forName("com.mysql.jdbc.Driver");
        c=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
        Statement s =c.createStatement();
	String sql = "select * from administrator";
	rs=(ResultSet) s.executeQuery(sql);
	while(rs.next())
	{
		str=rs.getString("username");	
		str1=rs.getString("password");
                session.setAttribute("getAlert", "Yes");
		if(str2.compareTo(str)==0 && str3.compareTo(str1)==0)
		{
		    %><jsp:forward page="adminhome.jsp"/> <%
		}
		else{
			
                    t2="User Name and password incorrect";		}

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
<title>ADMINISTRATOR LOGIN FORM</title>
<script language="javascript" >
function fun3()
{
    var name=document.adminlogin.uname.value;
    var pass=document.adminlogin.PASSWORD.value;
    if(name =="" || pass == "")
    {
        alert("Enter username and password");
        document.adminlogin.Name.focus();
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
        <li><a href="adminlogin.jsp">
        <span class="icon"><i class="fas fa-stream"></i></span>
        <span class="title">Login</span>
        </a></li>
        <li><a href="contact.jsp">
        <span class="icon"><i class="fas fa-envelope"></i></span>
        <span class="title">Contact Us</span>
        </a></li>
        </ul>
    </div>
    
<br>
<br>
<br>
<br>
    
<center>
    <form name="adminlogin" action="adminlogin.jsp" method="POST"  >      
        <table border="0" cellspacing=0 cellpadding=5 >
<tr>
	<th>USER NAME :</th>
	<td><input name="uname" type=text size="20" ></td>
</tr>
<tr>
	<th>PASSWORD :</th>
	<td><input name="PASSWORD" type=password size="20" ></td>
</tr>
 
<caption align=bottom>
<input type="submit" value=SUBMIT>
</caption>
</table>
</center>
</form>	
</body>
</html>