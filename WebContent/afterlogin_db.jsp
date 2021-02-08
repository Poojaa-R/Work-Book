<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%@page import="java.sql.*" %>
   <%@page import="java.util.*" %>
<%
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
	String employee_id=(String)session.getAttribute("employee_id");
	String name=(String)session.getAttribute("name");
	String mobile_no=request.getParameter("mobile_no");
	String email=(String)session.getAttribute("email");
	String password=request.getParameter("password");
	String job=request.getParameter("job");
	String location=request.getParameter("location");
	String dob=request.getParameter("dob");
	String description=request.getParameter("description");
	Connection con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
	statement=con.createStatement();
	String sql = "insert into employee_signup values(?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps;
	try 
	{
	ps = con.prepareStatement(sql);
	ps.setString(1,employee_id);
	ps.setString(2,name);
	ps.setString(3,mobile_no);
	ps.setString(4,email);
	ps.setString(5,password);
	ps.setString(6,job);
	ps.setString(7,location);
	ps.setString(8,dob);
	ps.setString(9,description);
	ps.executeUpdate();
	
	} catch (SQLException e) 
	{
		e.printStackTrace();
	}
	String sql1="select * from employee_signup where email=?";
	PreparedStatement ps1;
	int flag=0;
	try
	{
		PreparedStatement preparedStatement = con.prepareStatement(sql1);
        preparedStatement.setString(1, email);
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()) 
        {
           response.sendRedirect("job.jsp");
           flag=1;
		}
	}
	catch (SQLException e) 
	{
		e.printStackTrace();
	}
	
	
	
%>

</body>
</html>