<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>bidding</title>
   
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,9--&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins',sans-serif;
}
body{
    display:flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    
   /* background: url(../HTML/img20.png)no-repeat top center;*/

   /* background-size: cover;*/
   background-color: whitesmoke;
   justify-content:space-around;
   flex-direction:column;
   height:730px;
   margin-top:50px
}
.container{

    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    max-width: 1200px;
    flex-wrap: wrap;
    z-index: 1;
}
.container .card{
    position: relative;
    width: 200px;
    height: 250px;
    margin: 30px;
    box-shadow: 5px 5px 10px rgba(63, 63, 63, 0.25);
    border-radius: 15px;
    background: white;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    border-top: 1px solid rgba(225, 225, 225, 0.5);
    border-left: 1px solid rgba(225, 225, 225, 0.5);
    backdrop-filter: blur(0px);
    
}
.container .card .content{
    padding: 20px;
    text-align: center;
    transition: 0.5s;
    color: black;
}

.container .card .content h5{
    color: gray;
}
.container .card .content h3{
    font-size: 22px;
    color:crimson;
    z-index: 1;
    margin-top: 10px;
}

.container .card .content p{
    
    
    font-size: 11.5px;
    margin-top: 10px;
    color: rgb(105, 102, 102);
}
.container .card .content .btn{
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
    height: 30px;
    padding: 10px;
}
</style>
</head>
 <%@include file="nav_bar_employer.jsp" %>
<body>

<%@ page import="java.sql.*"%>
<%!

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

<h1>Your Job Posts</h1>
<div class="container" style="margin:150px">

<%


loadDriver(dbDriver);
Connection con=getConnection();
String sql="select * from job_post where employer_id=?";
String employer_id=(String)session.getAttribute("employer_id");
try
{
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1,employer_id);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>	      <div class="card">
            <div class="content">
                <h4><%=rs.getString("job") %></h4>
               
                <h5><%=rs.getString("district") %></h5>
                <h3><%=rs.getString("job_description") %></h3>
                <p><%=rs.getString("due_date") %></p>
                <a  href="Applied_jobs.jsp?job_id=<%=rs.getInt("job_id")%>"><button class="btn">View</button></a> 
            </div>
         </div>
<%}
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}

%>
</div>

</body>
</html>