<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Post</title>
<link
			rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
			crossorigin="anonymous"
		/>
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,9--&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins',sans-serif;
    
}
body{
    background-color: crimson;
}
.navbar {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    background-color: blueviolet;
    align-items: center;
}
.navbar > button {
    height: 40px;
    width: 80px;
}
.input_form {
margin-top:80px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.btn {
    background-color:crimson;
    color: aliceblue;
}
.name-info {
    background-color: lightgreen;
    height: 100px;
}
label{
font-weight: bolder;
font-style: italic;
}
.input_form .mb4{
    color: crimson;
}
.card{
    position: relative;
    width: 700px;
    height:100%;
    margin: 30px;
    box-shadow: 20px 20px 50px rgba(0,0,0,0.5);
    border-radius: 15px;
    background: white;
    overflow: hidden;
    display: flex;
    justify-content: center;
    float: left;
    margin-left: 300px;
    align-items: center;
    border-top: 1px solid rgba(225, 225, 225, 0.5);
    border-left: 1px solid rgba(225, 225, 225, 0.5);
    backdrop-filter: blur(100px);
}	
</style>
<%String company=""; %>
</head>
<body>
<%@ page import="java.sql.*"%>
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
<%
loadDriver(dbDriver);
Connection con=getConnection();
String sql="select * from job_post where employer_id=?";
String employer_id=(String)session.getAttribute("employer_id");
System.out.println(employer_id);
try
{
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1,employer_id);
ResultSet rs=ps.executeQuery();

while(rs.next())
{
	company=rs.getString("company_name");
}
session.setAttribute("company_name",company);
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}

%>
	<%@include file="nav_bar_employer.jsp" %>
		<div style="margin-top:100px; margin-left:330px" class="card">
        <div class="input_form">
            <form action="job_post_controller.jsp">
                <h1 class="mb-4">Job Information</h1>
                <div class="form-group">
    
                    <label for="exampleInputEmail1">Job Name</label>
                    <input
                        type="text"
                        class="form-control"
                        id="exampleInputEmail1"
                        aria-describedby="emailHelp"
                        placeholder="Enter job..."
                        name="job_name"
                        required
                    />
                    <br><label>Job Type</label><br>
                    <input required type="radio" id="male" name="job_type" value="Technical">
                    <label for="Technical">Technical</label><br>
                    <input required type="radio" id="female" name="job_type" value="Non-technical">
                    <label for="Non-technical">Non-technical</label><br>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1"
                        >Job Description</label
                    >
                    <textarea
                        class="form-control"
                        id="exampleFormControlTextarea1"
                        rows="3"
                        placeholder="Job description...."
                        name="job_description"
                        required
                    ></textarea>
                </div>
                <hr />
                <h1 class="mb-4">Contact Information</h1>
                <div class="form-row contact">
                    <div class="col">
                        <label>Email</label>
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Email"
                            name="email"
                            required
                        />
                    </div>
                    <div class="col">
                        <label>Contact Number</label>
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Phone Number"
                            name="number"
                            required
                        />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Address</label>
                    <input
                        type="text"
                        class="form-control"
                        id="inputAddress"
                        placeholder="Enter your Address...."
                        name="address"
                        required
                    />
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputCity">City</label>
                        <input
                            type="text"
                            class="form-control"
                            id="inputCity"
                            name="city"
                            required
                        />
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputCity">State</label>
                        <input
                            type="text"
                            class="form-control"
                            id="inputCity"
                            name="state"
                            required
                        />
                    </div>
                </div>
                <hr />
                <h1 class="mb-4">Bidding Information</h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputCity">Bid Amount</label>
                            <input
                                type="number"
                                class="form-control"
                                id="inputCity"
                                name="bid_amount"
                                required
                            />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputCity">No of days</label>
                            <input
                                type="number"
                                class="form-control"
                                id="inputCity"
                                class="days"
                                name="days"
                                required
                            />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputCity"
                                >Number of people</label
                            >
                            <input
                                type="number"
                                class="form-control"
                                id="inputCity"
                                class="people"
                                name="people"
                                required
                            />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputCity">Due Date</label>
                            <input
                                type="date"
                                class="form-control"
                                id="inputCity"
                                name="date"
                                required
                            />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input
                                type="submit"
                                class="form-control btn"
                            />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>	
</body>


</html>
