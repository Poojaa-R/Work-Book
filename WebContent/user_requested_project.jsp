<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<html>
<head>
  <title>Bootstrap Card</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
  function next()
  {
	  window.location.href = "http://localhost:8088/Bootathon2/Request_pending.jsp";
  }
  </script>
  </head>
  
  <%@include file="user_profile.jsp" %>
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
    background: green;
    color: #fff;
    border-radius: 8px;
    text-decoration: none;
    border: none;
    box-shadow: 0 5px 15px rgba(0,0,0,0.5);
    width: 90px;
    cursor: pointer;
    height: 40px;
    padding: 10px;
}
</style>
<body>
<div class="container" style="margin-top:10px">
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from job_status where employee_id='"+employee_id+"'";
resultSet = statement.executeQuery(sql);
ArrayList<ArrayList<String>> al=new ArrayList<ArrayList<String>>();
while(resultSet.next())
{
	ArrayList<String> al1=new ArrayList<String>();
	int employer_acceptance_status=resultSet.getInt("employer_acceptance_status");
	if(employer_acceptance_status!=1)
	{
		al1.add(resultSet.getString("job_id"));
		al1.add(resultSet.getString("employee_bid_amount"));
		al.add(al1);
	}
}
for(int i=0;i<al.size();i++)
{
	ArrayList<String> al1=al.get(i);
	int job_id=Integer.parseInt(al1.get(0));
	String bid=al1.get(1);
	String sql4="select * from job_post where job_id=?";
	try {
		PreparedStatement preparedStatement = connection.prepareStatement(sql4);
        preparedStatement.setInt(1,job_id);
        resultSet = preparedStatement.executeQuery();
        while(resultSet.next())
    	{
    			al1.add(resultSet.getString("job"));
    			al1.add(resultSet.getString("job_description"));
    			al1.add(resultSet.getString("district"));
    			al.set(i,al1);
    			
    	}
        
    } catch(Exception e) {
        System.out.println("Exception is: " + e);
    } 
	
}
loop:
while(!al.isEmpty())
{
	ArrayList<String> al1=al.get(0);
	%>
	<div class="card">
            <div class="content">
                <h4><%=al1.get(2) %></h4>
               
                <h5><%=al1.get(4) %></h5>
                <h3><%=al1.get(3) %></h3>
                <p><%=al1.get(1) %></p> 
                  <button  onclick="next()"> Check </button>
            </div>
         </div>
	<%
	al.remove(0);
}
//System.out.println(al);
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</div>
</body>
</html>