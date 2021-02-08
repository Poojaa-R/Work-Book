<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/database1";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%
String employer_id=(String)session.getAttribute("employer_id");
String job = (String)request.getParameter("job_name");
String job_description = (String) request.getParameter("job_description");
String email = (String)request.getParameter("email");
String phno = (String) request.getParameter("number");
String address = (String) request.getParameter("address");
String city = (String)request.getParameter("city");
String jobpost = (String)request.getParameter("job_type");
String state = (String)request.getParameter("state");
int bid_amount = Integer.parseInt((String)request.getParameter("bid_amount"));
int days = Integer.parseInt((String)request.getParameter("days"));
int people = Integer.parseInt((String)request.getParameter("people"));
String date = (String)request.getParameter("date");	
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql1 = "insert into job_post values(default,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
String company=(String)session.getAttribute("company_name");
PreparedStatement ps;
try {
ps = connection.prepareStatement(sql1);

ps.setString(1,employer_id);
ps.setString(2,job);
ps.setString(3,job_description);
ps.setString(4,email);
ps.setString(5,phno);
ps.setString(6,address);
ps.setString(7,state);
ps.setString(8,city);
ps.setInt(9,bid_amount);
ps.setInt(10,days);
ps.setInt(11,people);
ps.setString(12,date);
ps.setString(13,jobpost);
ps.setString(14,company);
ps.executeUpdate();	

}
catch (Exception e)
{
	e.printStackTrace();
}
response.sendRedirect("job_post.jsp");
%>
</body>
</html>