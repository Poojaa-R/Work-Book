<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function review(job_id)
{
	window.location.href = "http://localhost:8088/Bootathon2/Selected_candidate.jsp?job_id="+job_id;
}
function rating(job_id)
{
	window.location.href = "http://localhost:8088/Bootathon2/Sort_by_rating.jsp?job_id="+job_id;
}
</script>
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,9--&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins',sans-serif;
}
body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
   /* background: url(../HTML/img20.png)no-repeat top center;*/

   /* background-size: cover;*/
   background-color: whitesmoke;
   flex-direction:column;
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
.container .card .content button{
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
.select-btn 
{
	
	width:200px;
	height:50px;
	background-color:white;
	color:crimson;
	font-size:15px;
	margin-left:850px;
	margin-top:70px;
	border-radius:30px;
	stroke-width: 3em;
	 border-width: 3px;
	border-color:crimson;
}
.select-btn:hover{
background-color:crimson;
	color:white;
}
button:focus{
    outline: none;
    }
.select-box
{
	
}
</style>
</head>
<%@include file="nav_bar_employer.jsp" %>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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
<%int job_id=Integer.parseInt(request.getParameter("job_id"));
ArrayList<String> eid=new ArrayList<String>();%>
<div class="select-box">
<button class="select-btn" onclick='review(<%=job_id%>)'> Selected candidates</button>
</div>
<div class="container" style="margin:100px">
<%
ArrayList<String> rating_employee=new ArrayList<String>();
loadDriver(dbDriver);
Connection con=getConnection();

//System.out.println(job_id);
String sql="select * from job_status natural join employee_signup where job_id=?";
try
{
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1, Integer.parseInt(request.getParameter("job_id")));
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	if(rs.getInt("employer_acceptance_status")!=1)
	{
		rating_employee.add(rs.getString("employee_id"));
		eid.add(rs.getString("employee_id"));
%>
		<div class="card">
            <div class="content">
            
                <h4><%=rs.getString("location") %></h4>
                <h3><%=rs.getString("name") %></h3>
                <p><%=rs.getString("employee_bid_amount")  %> bid</p>
                <a  href="View_employee_details.jsp?employee_amount=<%=rs.getInt("employee_bid_amount")%>&employee_id=<%=rs.getString("employee_id")%>&status_id=<%=rs.getInt("jobstatus_id")%>"><button class="btn">View</button></a> 
            </div>
         </div>
<%
	}
}
//System.out.println(rating_employee);
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}


%>
</div>
</body>
</html>