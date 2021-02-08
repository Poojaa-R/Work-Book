<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%!String buffer=""; %>
<%

String name = request.getParameter("name").toString();

try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database1", "root", "root");
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select * from job_post where district like '"+name+"%'");
while(rs.next())
{
buffer="<option>";
buffer=buffer+rs.getString("district")+"<br>";
}
buffer=buffer+" </option>";  
response.getWriter().println(buffer+"");
}
catch (Exception e) {
System.out.println(e);
}
%>
</body>
</html>