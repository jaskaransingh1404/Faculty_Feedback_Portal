<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
Connection c=null;
ResultSet rs=null;
try
{
    int flag=0;	
    String str1, str2,str3, str4, sql,sql1;
    str1=request.getParameter("eid");
    str2=request.getParameter("dname");
    if( str1 != null || str2 != null)
    {	
        Class.forName("com.mysql.jdbc.Driver");
        c=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/facultyfeedback?zeroDateTimeBehavior=convertToNull","root","");
        Statement s =c.createStatement();
        sql="select * from teacher where eid='"+str1+"'";
        rs=(ResultSet) s.executeQuery(sql);
        while(rs.next())
        {		
            str3=rs.getString("eid");
            str4=rs.getString("department");	
            if(str1.compareTo(str3)==0 && str2.compareTo(str4)!=0 )
            {
                out.println("Faculty with Employee Id "+str1+" is of other department.");                            
                flag=1;
                break;
            }
        }
        if(flag==0)
        {
            sql1 = "delete from teacher where eid='"+str1+"' and department='"+str2+"'";
            s.execute(sql1);
            %><jsp:forward page="adminhome.jsp"/> <%
	}
}
%>
<%}catch(Exception e ){}
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
<title>ADD NEW FACULTY</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="style_1.css" type="text/css"/>
<script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script language="javascript" >
function fun()
{
    var name=document.removeteacher.tname.value;
    var dname=document.removeteacher.dname.value;
    if(name=="" || dname=="")
    {
        alert("First Details must be filled");
        return false;
    }
}
</script>
</head>
<body>
<form name="removefaculty" action="removefaculty.jsp" onsubmit="return fun()" >
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
            <li><a href="contact.jspS">
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
            <h2>REMOVE FACULTY </h2>
            <table width="50%" border="0" align="center" cellpadding="5" cellspacing="5"> 
                <tr>
                <tr>
                    <th align=left>Enter EID :</th><td align=left><input type=text name=eid size="37" ></td>
                </tr>
                    <th align=left>Select the Department :</th><td align=left><select name="dname" size="1">
                    <option value="">
                    <option value="Aerospace">Aerospace Engineering
                    <option value="Applied Sciences">Applied Sciences
                    <option value="Civil">Civil Engineering
                    <option value="Computer Science">Computer Science & Engineering
                    <option value="Electrical">Electrical Engineering
                    <option value="Electronics & Communication">Electronics & Communication Engineering
                    <option value="Mechanical">Mechanical Engineering
                    <option value="Metallurgical">Materials & Metallurgical Engineering
                    <option value="Production">Production & Industrial Engineering
                    </select></td>

                <tr>
                    <th colspan=0 align=right><input type="RESET" value=RESET></th>
                    <th colspan=0 align=left><input type="SUBMIT" value=SUBMIT></th>
                </tr>
            </table>
        </center>
    </section>
</form>
</body>
</html>