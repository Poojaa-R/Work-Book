<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

*{
 margin: 0;
 padding: 0;
 box-sizing: border-box;
 font-family: "Poppins", sans-serif;

}
body{
    background:white no-repeat top center;
    background-size: cover;
    height: 100vh;
	font-family: 'Montserrat', sans-serif;

}
.box{
    background-color:white;
    box-sizing: border-box;
    border-style: groove;
    
    position: relative;
    width: 500px;
    height: 500px;
    margin-top: -600px;
    justify-content: center;
    align-items: center;
    margin-left: 450px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.5);
    border-radius: 20px;
}
.box .title{
    text-align: center;
    
  background: -webkit-linear-gradient(rgb(240, 113, 138),crimson);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
    text-shadow: rgb(212, 211, 211);
    letter-spacing: 5px;
    font-size: 20px;
}
.box .content{
    margin-top: 25px;
    padding-left: 40px;
    padding-bottom: 25px;
}
.box .content span{
    font-weight: lighter;
}
.box .content .ind{
    padding-top: 15px;
}
.box:before{
    content: '';
    position: absolute;
    top: -2px;
    left: -2px;
    right: -2px;
    bottom: -2px;
    background: #fff;
    z-index: -1;
}
.box:after{
    content: '';
    position: absolute;
    top: -2px;
    left: -2px;
    right: -2px;
    bottom: -2px;
    background: #fff;
    z-index: -1;
    filter: blur(40px);
}
.box:before,.box:after{
    background: linear-gradient(235 deg,#89ff00,#060c21,#060c21,#00bcd4);
}
.accept{
    position: relative;
    display: inline-block;
    padding: 8px 20px;
    margin-top: 25px;
    background: crimson;
    color: #fff;
    border-radius: 8px;
    text-decoration: none;
    border: none;
    box-shadow: 0 5px 15px rgba(0,0,0,0.5);
    width: 80px;
    cursor: pointer;
    height: 40px;
    padding: 10px;
    margin-left:100px;
    
}
.accept1{
    position: relative;
    display: inline-block;
    padding: 8px 20px;
    margin-top: 15px;
    background: crimson;
    color: #fff;
    border-radius: 8px;
    text-decoration: none;
    border: none;
    box-shadow: 0 5px 15px rgba(0,0,0,0.5);
    width: 90px;
    cursor: pointer;
    height: 40px;
    padding: 10px;
    margin-left:50px;
    font-size:12px;
}
</style>
</head>
<%@include file="nav_bar_employer.jsp" %>
<body>
 <%@ page import="java.sql.*"%>
<%!
public static String mail="";
private static String dbUrl ="jdbc:mysql://localhost:3306/database1";
private static String dbUname = "root";
private static String dbPassword = "root";
private static String dbDriver = "com.mysql.jdbc.Driver";
public static void loadDriver(String dbDriver)
{
	try
	{
		Class.forName(dbDriver);
	} catch (ClassNotFoundException e) 
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public static Connection getConnection()
{
	Connection con = null;
	try {
		con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return con;
}



%>
<div style="margin-top:100px" class="box">
        <div class="title">
            <div class="text">
                <h1>ABOUT</h1>
            </div>
            
        </div>
        <div class="content">
<%
//loadDriver(dbDriver);
Connection con=getConnection();
String employee_id="";
String sql="select * from employee_signup where employee_id=?";
try
{
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1,request.getParameter("employee_id"));
String employee_name="";
ResultSet rs=ps.executeQuery();
while(rs.next())
{
  mail=rs.getString("email");
  employee_id=rs.getString("employee_id");
  employee_name=rs.getString("name");
%>
      
  <h4>
                
                <div class="ind">
                    Name : <span style="margin-left:140px;"><%=rs.getString("name") %></span>  <br>
                </div>
                <div class="ind">
                    Employee amount : <span style="margin-left:39px;"><%=request.getParameter("employee_amount") %></span> <br>
                </div>
                <div class="ind">
                    Mobile no : <span style="margin-left:108px;"><%=rs.getString("mobile_no") %></span><br>
                </div>
                <div class="ind">
                   Email : <span style="margin-left:140px;"><%=rs.getString("email") %></span><br>
                </div>
                <div class="ind">
                   Job : <span style="margin-left:156px;"><%=rs.getString("job") %></span> <br>
                </div>
                <div class="ind">
                    Description : <span style="margin-left:90px;"><%=rs.getString("description") %></span><br>
                </div>
                 <div class="ind">
                    Location : <span style="margin-left:115px;"><%=rs.getString("location") %></span><br>
                </div>
                
            </h4>
            <%}
//System.out.println("view_employee"+" "+employee_id);
%>
<%
session.setAttribute("employee_id",employee_id);
%>
<a  href="Accept_employee.jsp?status_id=<%=request.getParameter("status_id")%>&email=<%=mail%>&employee_name=<%=employee_name%>"><button class="accept">Accept</button></a>
<a  href="user_profile.jsp?"><button class="accept1">View Profile</button></a> 
<%
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}

%>
</div>
</div>

</body>
</html>