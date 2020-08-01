<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
Connection c=null;
ResultSet rs=null;
try
{
        String str4, str1, str2, str3,str5;
	str1=request.getParameter("uname");
	str2=request.getParameter("PASSWORD");
	Class.forName("com.mysql.jdbc.Driver");
 	c=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
	Statement s =c.createStatement();
	String sql = "select * from teacher where eid='"+str1+"'";
	rs=(ResultSet) s.executeQuery(sql);
	while(rs.next())
	{
            str3=rs.getString("eid");	
            str4=rs.getString("password");
            str5=rs.getString("name");
            session.setAttribute("facultyname", str5);     
            if(str1.compareTo(str3)==0 && str2.compareTo(str4)==0)
            {
                response.sendRedirect("facultyhome.jsp");
            }
            else
            {
                str5="User Name and password incorrect";		
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FACULTY LOGIN FORM</title>
<script language="javascript" >
function fun3()
{
    var name=document.facultylogin.uname.value;
    var pass=document.facultylogin.PASSWORD.value;
    if(name =="" || pass =="")
    {
        alert("Enter the Details First");
        document.facultylogin.Name.focus();
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
<form name="facultylogin" action="facultylogin.jsp"  method=post>
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
        <li><a href="facultylogin.jsp">
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
            <h2>FACULTY LOGIN</h2>
            <br><br><br>
            <table border="0" cellspacing=0 cellpadding=5 >
                <caption align=bottom>
                <br>
                <input type="SUBMIT" value=SUBMIT>
                </caption>
                <tr>
                    <th>Enter EID  :</th>
                    <td><input name="uname" value="" type=text size="20"></td>
                </tr>
                <tr>
                    <th>PASSWORD :</th>
                    <td><input name="PASSWORD" value="" type=password size="20"></td>
                </tr>
            </table>
            <br><br><br>
        </center>
    </section>    
</form>
</body>
</html>