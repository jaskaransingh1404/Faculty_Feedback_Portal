<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
Connection c=null;
ResultSet rs=null;
try
{
	int flag=0;
	String sql,sql1;
	String str1,str2,str3,str5,str4,str6,str7;
        str1=request.getParameter("eid");
	str2=request.getParameter("fname");
	str3=request.getParameter("dname");
	str5=request.getParameter("passwd");
        str4=request.getParameter("email");
        str7=request.getParameter("mobile");
 
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
                sql1 = "insert into teacher values ('"+str1+"','"+str2+"','"+str3+"','"+str4+"','"+str7+"','"+str5+"')";
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
    <title>ADD NEW FACULTY</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="style_1.css" type="text/css"/>

    <script src="https://kit.fontawesome.com/d29a73daf6.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script language="javascript" >
function fun()
{
    var eid=document.addfaculty.eid.value;
    var name=document.addfaculty.fname.value;
    var dname=document.addfaculty.dname.value;
    var pass=document.addfaculty.passwd.value;
    if(name=="" || dname=="")
    {
        alert("Name is mandatory");
        return false;
    }
    if(eid=="" || pass=="")
    {
        alert("Password is mandatory");
        return false;
    }
}
</script>	
</head>
<body>
    <form name="addnewfaculty" action="addnewfaculty.jsp" method="POST"  >
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
           <h2>ADD NEW FACULTY </h2>
        </center>
        <table width="50%" border="0" align="center" cellpadding="5" cellspacing="5"> 
        <tr>
            <th align=left >EID :</th><td align=left><input type=text name=eid size="37" ></td>
        </tr>
        <tr>
    <tr>
    <th align=left>Faculty Name :</th><td align=left><input type=text name=fname size="37" ></td>
    </tr>
<tr>
<th align=left>E-Mail :</th><td align=left><input type=text name=email size="37" ></td>
</tr>
<tr>
<th align=left>Mobile No :</th><td align=left><input type=text name=mobile size="37" ></td>
</tr>
<tr>

<tr>
	<th align=left>Password :</th>
	<td align=left><input name="passwd" type=password size="37" ><br></td>
</tr>
<tr>
<th align=left>Department :</th><td align=left><select name="dname" size="1">
		<option value="">
		<option value="Aerospace">Aerospace Engineering
                <option value="Civil">Civil Engineering
		<option value="Computer Science">Computer Science & Engineering
		<option value="Electrical">Electrical Engineering
		<option value="Electronics">Electronics & Communication Engineering
                <option value="Mechanical">Mechanical Engineering
                <option value="Metallurgy">Materials & Metallurgical Engineering
                <option value="Production">Production & Industrial Engineering
                <option value="Applied Sciences">Applied Sciences
		</select></td>
</tr>
<tr>
	<th colspan=0 align=right><input type="RESET" value=RESET></th>
	<th colspan=0 align=left><input type="SUBMIT" value=SUBMIT></th>
</tr>
</table> 
    </section>
    </form>

	
</body>
</html>