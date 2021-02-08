<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
  <title>Work Book</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
  </head>
  
  <%@include file="nav_bar.jsp" %>
  <script>
  function clickhere(job_id) 
 	{
 		window.location.href = "http://localhost:8088/Bootathon2/job_detail.jsp?job_id="+job_id;
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
.container button{
    position: relative;
    display: inline-block;
    margin-top: 25px;
    background: crimson;
    color: #fff;
    border-radius: 8px;
    text-decoration: none;
    border: none;
    box-shadow: 0 5px 15px rgba(0,0,0,0.5);
    width: 90px;
    cursor: pointer;
    height: 40px;
   
    font-size:17px;
    padding-bottom:5px;
}
.searchbar {
			width: 500px;
			margin: 30px 30px 30px 30px;
			height: 50px;
			border-radius: 30px;
			border: 2px solid crimson;
			background-color: white;
			float:right;
			font-size:15px;
		}
	input:focus{
    outline: none;
}
.search_form
{
	display:flex;
	flex-direction:row;
	justify-content:center;
	align-items:center;
	justify-content:space-around;
	width: 700px;
	height:100px;
}
</style>
<script type="text/javascript">
function showData(value){ 

xmlHttp=GetXmlHttpObject()
var url="auto.jsp";
url=url+"?name="+value;
xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}
function stateChanged() { 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
    var showdata = xmlHttp.responseText; 
    document.getElementById("datalist").innerHTML=showdata;
    } 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try {
  xmlHttp=new XMLHttpRequest();
 }
catch (e) {
 try  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
function showData1(value){ 

	xmlHttp=GetXmlHttpObject()
	var url="auto1.jsp";
	url=url+"?name="+value;
	xmlHttp.onreadystatechange=stateChanged 
	xmlHttp.open("GET",url,true)
	xmlHttp.send(null)
	}
	function stateChanged() { 
	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
	    var showdata = xmlHttp.responseText; 
	    document.getElementById("datalist").innerHTML=showdata;
	    } 
	}
	function GetXmlHttpObject(){
	var xmlHttp=null;
	try {
	  xmlHttp=new XMLHttpRequest();
	 }
	catch (e) {
	 try  {
	  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	  }
	 catch (e)  {
	  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	 }
	return xmlHttp;
	}
</script>
<body>

<div class="container" style="margin-top:100px">
<form class="search_form" name="employee" action="job_type.jsp">
<input  type="search" class="searchbar" placeholder="     Search jobs" name="name" id="name" onkeyup="showData(this.value);" autocomplete="off" list="datalist"><br>
<datalist id="datalist"></datalist>
<button type="submit" style="margin-top:-8px">Search</button>
</form>

<div class="container" style="margin-top:30px">
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from job_post where no_of_people>0 AND due_date >= cast(now() as date)";
resultSet = statement.executeQuery(sql);
ArrayList<ArrayList<String>> al=new ArrayList<ArrayList<String>>();
while(resultSet.next())
{
	ArrayList<String> al1=new ArrayList<String>();
	al1.add(String.valueOf(resultSet.getInt("job_id")));
	al1.add(resultSet.getString("job"));
	al1.add(resultSet.getString("district"));
	al1.add(String.valueOf(resultSet.getInt("bid_amount")));
	al1.add(String.valueOf(resultSet.getInt("no_of_days")));
	al1.add(resultSet.getString("job_description"));
	al.add(al1);
}
loop:
while(!al.isEmpty())
{
	ArrayList<String> al1=al.get(0);
	%>
	<div class="card">
    <div class="content">
        <h4><%= al1.get(1) %></h4>
       
        <h5><%=al1.get(2) %></h5>
        <h3><%=al1.get(5) %></h3>
        <p><%=al1.get(3) %>  bid</p>
        <%
      String n=al1.get(0);
       int n1=Integer.parseInt(n);
      %>
        <button onclick="clickhere('<%=n1 %>')">Bid now</button>
    </div>
 </div>
 <%
	al.remove(0);
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<div class="container" style="margin-top:100px">
<form class="search_form" name="employee" action="job_type1.jsp">
<input  type="search" class="searchbar" placeholder="     Search using your current location" name="name" id="name" onkeyup="showData1(this.value);" autocomplete="off" list="datalist"><br>
<datalist id="datalist"></datalist>
<button type="submit" style="margin-top:-8px">Search</button>
</form>

<div class="container" style="margin-top:30px">
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from job_post where no_of_people>0 AND due_date >= cast(now() as date)";
resultSet = statement.executeQuery(sql);
ArrayList<ArrayList<String>> al=new ArrayList<ArrayList<String>>();
while(resultSet.next())
{
	ArrayList<String> al1=new ArrayList<String>();
	al1.add(String.valueOf(resultSet.getInt("job_id")));
	al1.add(resultSet.getString("job"));
	al1.add(resultSet.getString("district"));
	al1.add(String.valueOf(resultSet.getInt("bid_amount")));
	al1.add(String.valueOf(resultSet.getInt("no_of_days")));
	al1.add(resultSet.getString("job_description"));
	al.add(al1);
}
loop:
while(!al.isEmpty())
{
	ArrayList<String> al1=al.get(0);
	%>
	<div class="card">
    <div class="content">
        <h4><%= al1.get(1) %></h4>
       
        <h5><%=al1.get(2) %></h5>
        <h3><%=al1.get(5) %></h3>
        <p><%=al1.get(3) %>bid</p>
        <%
      String n=al1.get(0);
       int n1=Integer.parseInt(n);
      %>
        <button onclick="clickhere('<%=n1 %>')">Bid now</button>
    </div>
 </div>
 <%
	al.remove(0);
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
</div>
</div>
</div>

</body>
</html>