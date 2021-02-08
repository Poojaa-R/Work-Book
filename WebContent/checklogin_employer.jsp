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
	String email1=request.getParameter("email");
	String name1=request.getParameter("name");
	String id1 =request.getParameter("id");
	session.setAttribute("employer_id",id1);
	session.setAttribute("employer_name",name1);
	session.setAttribute("employer_email",email1);
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
		String sql1="select * from employer where email=?";
		PreparedStatement ps1;
		int flag=0;
		try
		{
			PreparedStatement preparedStatement = con.prepareStatement(sql1);
	        preparedStatement.setString(1, email1);
	        ResultSet rs = preparedStatement.executeQuery();
	        while(rs.next()) 
	        {
	           response.sendRedirect("job_post.jsp");
	           flag=1;
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		if(flag==0)
		{
			response.sendRedirect("afterlogin_employer.jsp");
		}
		
		
		
	%>

</body>
</html>