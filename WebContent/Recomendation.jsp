<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
<style>
* {
  box-sizing: border-box;
  margin:0;
  padding:0;
  font-family: 'poppins' ,sans-serif;
}
body {
  display:flex;
  justify-content: center;
  align-items: center;
  min-height:100vh;
  background-attachment: fixed;
}
button{
  background-color: crimson;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
  
}

button:hover {
  background-color:red ;
}
.container
{
  position:relative;
  width:1100px;
  padding:20px;
  display:flex;
  padding-top:100px;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
}
.container .card {
  position:relative;
  width:200px;
  height:320px;
  background:#f5f0f0;
  margin:20px;
  border-radius:20px;
  overflow:hidden;
  box-shadow: 0,15px 25px rgba(0,0,0,0.2);
  transition:0.5s;
}

.container .card .circle
{
  position:relative;
  width:100%;
  height:100%;
  background-color:crimson;
  clip-path:circle(140px at center 0);
  text-align:center;
}
.container .card .circle h2
{
  color: #fff;
  font-size: 2em;
  padding:30px 0;
}
.container .card .content 
{
  position: absolute;
  bottom:10px;
  padding: 20px;
  text-align:center;
}
.container .card .content p
{
  color:#666;
}
.container .card .content a
{
  position:relative;
  display:inline-block;
  padding:10px 20px;
  background:#000;
  color:#fff;
  border-radius: 40px;
  text-decoration: none;
  margin-top: 20px;

}
.conatiner .card:nth-child(1) .circle,.container .card:nth-child(1) .content a
{
  background: #ffaf00;
}
.conatiner .card:nth-child(2) .circle,.container .card:nth-child(2) .content a
{
  background: #da2268;
}
.conatiner .card:nth-child(3) .circle,.container .card:nth-child(4) .content a
{
  background: #bb02ff;
}
</style>
</style>
<body>
 <%@page import="java.sql.*" %>
   <%@page import="java.util.*" %>
   <%
   	ArrayList<Integer> al=new ArrayList<Integer>();
	 String dbUrl = "jdbc:mysql://localhost:3306/database1";
	 String dbUname = "root";
	 String dbPassword = "root";
	 String dbDriver = "com.mysql.jdbc.Driver";
	try {
		Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Statement statement = null;
		ResultSet resultSet = null;
	Connection con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
	statement=con.createStatement();
	String id=(String)session.getAttribute("employee_id");
	String sql = "select job_id from job_status where employee_id=?";
	try {
		PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.setString(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next())
        {
        	int job_id=rs.getInt("job_id");
        	al.add(job_id);
        } 
        
    } catch(Exception e) {
        System.out.println("Exception is: " + e);
    } 
	ArrayList<String> al1=new ArrayList<String>();
	String sql2= "select location from employee_signup where employee_id=?";
	try {
		PreparedStatement preparedStatement = con.prepareStatement(sql2);
        preparedStatement.setString(1,id);
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next())
        {
        	String location=rs.getString("location");
        	al1.add(location);
        } 
        
    } catch(Exception e) {
        System.out.println("Exception is: " + e);
    } 

	for(int i=0;i<al.size();i++)
	{
		String sql1="select job from job_post where job_id=?";
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql1);
	        preparedStatement.setInt(1,al.get(i));
	        ResultSet rs = preparedStatement.executeQuery();
	        while(rs.next())
	        {
	        	String job=rs.getString("job");
	        	al1.add(job);
	        } 
	        
	    } catch(Exception e) {
	        System.out.println("Exception is: " + e);
	    } 
	}
	ArrayList<ArrayList<String>> rec=new ArrayList<ArrayList<String>>();
	for(int i=0;i<al1.size();i++)
	{
		String sql1="select * from job_post where district=? OR job=?";
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql1);
	        preparedStatement.setString(1,al1.get(i));
	        preparedStatement.setString(2,al1.get(i));
	        ResultSet rs = preparedStatement.executeQuery();
	        while(rs.next())
	        {
	        	ArrayList<String> rec1=new ArrayList<String>();
	        	String mobile=rs.getString("mobile_no");
	        	String email=rs.getString("email");
	        	String job=rs.getString("job");
	        	String job_description=rs.getString("job_description");
	        	String address=rs.getString("address");
	        	String state=rs.getString("state");
	        	String district=rs.getString("district");
	        	String bid_amount=rs.getString("bid_amount");
	        	String no_of_days=rs.getString("no_of_days");
	        	String due_date=rs.getString("due_date");
	        	String no_of_people=rs.getString("no_of_people");
	        	rec1.add(mobile);
	        	rec1.add(email);
	        	rec1.add(job);
	        	rec1.add(address);
	        	rec1.add(state);
	        	rec1.add(district);
	        	rec1.add(job_description);
	        	rec1.add(district);
	        	rec1.add(bid_amount);
	        	rec1.add(no_of_days);
	        	rec1.add(no_of_people);
	        	rec1.add(due_date);
	        	rec.add(rec1);
	        } 
	        
	    } catch(Exception e) {
	        System.out.println("Exception is: " + e);
	    } 
	}
	%>
	<div class="container">
	<%
	loop:
	while(!rec.isEmpty())
	{
		ArrayList<String> al2=rec.get(0);
		%>
		  <div class="card">
	      <div class="circle">
	        <h2><%= al2.get(0) %></h2>
	      </div>
	      <div class="content">
	      <h4><%=al2.get(1) %></h4>
	      <p><%=al2.get(2) %></p>
	      <p><%=al2.get(3) %>  bid</p>
	       <%
	      String n=al2.get(0);
	       int n1=Integer.parseInt(n);
	      %>
	      </div>
	    </div>
		<%
		rec.remove(0);
	}
	%>

	</div>
</body>
</html>