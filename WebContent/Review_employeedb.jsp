<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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
<body>
        
<%
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String employer_id=(String)session.getAttribute("employer_id");
String employee_id=(String)request.getParameter("employee_id");

String review=(String)request.getParameter("review");

String ratings=request.getParameter("ratings");
int flag=0;
String sql1 = "insert into review values(default,?,?,?,?)";
String job_id=request.getParameter("job_id");
PreparedStatement ps;
try {
ps = connection.prepareStatement(sql1);
ps.setString(1,employer_id);
ps.setString(2,employee_id);
ps.setString(3,review);
ps.setString(4,ratings);
ps.executeUpdate();	
}
	catch (Exception e)
	{
		e.printStackTrace();
	}
response.sendRedirect("Review_success.jsp");
%>


</body>
</html>