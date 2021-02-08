<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
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

</style>
<body>

	<%
		
			String employee_id=(String)request.getParameter("employee_id");
		//System.out.println(employee_id);
			String name1="";
			String email1="";
			String mobile_no1="";
			String location1="";
			String dob1="";
			String job_description1="";
			String job1="";
		%>
		<%@page import="java.sql.*" %>
	   <%@page import="java.util.*" %>
<%
		 String dbUrl = "jdbc:mysql://localhost:3306/database1";
		 String dbUname = "root";
		 String dbPassword = "root";
		 String dbDriver = "com.mysql.jdbc.Driver";
		 ArrayList<ArrayList<String>> ans=new ArrayList<ArrayList<String>>();
		try {
			Class.forName(dbDriver);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
			Statement statement1 = null;
			ResultSet resultSet1 = null;
		Connection con1 = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		statement1=con1.createStatement();
		String sql1="select * from employee_signup where employee_id=?";
		String sql2="select * from review where review_to=?";
		PreparedStatement ps1;
		try
		{
			PreparedStatement preparedStatement = con1.prepareStatement(sql1);
	        preparedStatement.setString(1, employee_id);
	        ResultSet rs = preparedStatement.executeQuery();
	        while(rs.next()) 
	        {
	        	name1=rs.getString("name");
	           job1=rs.getString("job");
	           email1=rs.getString("email");
				mobile_no1=rs.getString("mobile_no");
				location1=rs.getString("location");
				dob1=rs.getString("dob");
				job_description1=rs.getString("description");
				job1=rs.getString("job");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
%>
  <div class="box">
        <div class="title">
            <div class="text">
                <h1>ABOUT</h1>
            </div>
            <div>
                    Name : <span style="margin-left:78px;"><%=name1 %></span> <br>
                </div>
                <div >
                    Email : <span style="margin-left:80px;"><%=email1 %></span>  <br>
                </div>
                <div>
                    Phone : <span style="margin-left:75px;"><%=mobile_no1 %></span> <br>
                </div>
                <div >
                    Job : <span style="margin-left:97px;"><%=job1 %></span><br>
                </div>
                <div>
                   Description : <span style="margin-left:34px;"><%=job_description1 %></span><br>
                </div>
                <div>
                    Location : <span style="margin-left:58px;"><%=location1 %></span> <br>
                </div>
                <div>
                    Date of birth : <span style="margin-left:28px;"><%=dob1 %></span><br>
                </div>
        </div>
       
        </div>
    </div>

</body>
</html>