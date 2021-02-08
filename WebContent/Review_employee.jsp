
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Insert title here</title>
    <script>
        function rating(employee_id) {
            var review = document.getElementById("review").value;
            var ratings = document.getElementById("ratings").value;
            window.location.href = "http://localhost:8088/Bootathon2/Review_employeedb.jsp?employee_id=" + employee_id +
                "&review=" + review + "&ratings=" + ratings;
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;

        }

        body {
            background: white no-repeat top center;
            background-size: cover;
            height: 100vh;
            font-family: 'Montserrat', sans-serif;

        }
        

        .rating {
        flex-direction:row;
        justify-content:space-around;
      
        width:250px;
        margin-top:70px;
        position: absolute;
       
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotateY(180deg);
            display: flex;
        }

       
      

        .box {
            background-color: white;
            box-sizing: border-box;
            border-style: groove;

            position: relative;
            width: 500px;
            height: 500px;
            margin-top: -600px;
            justify-content: center;
            align-items: center;
            margin-left: 450px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
            border-radius: 20px;
        }

        .box .title {
            text-align: center;

            background: -webkit-linear-gradient(rgb(240, 113, 138), crimson);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: rgb(212, 211, 211);
            letter-spacing: 5px;
            font-size: 20px;
        }

        .box .content {
            margin-top: 25px;
            padding-left: 40px;
            padding-bottom: 25px;
        }

        .box .content span {
            font-weight: lighter;
        }

        .box .content .ind {
            padding-top: 15px;
        }

        .box:before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: #fff;
            z-index: -1;
        }

        .box:after {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: #fff;
            z-index: -1;
            filter: blur(40px);
        }

        .box:before,
        .box:after {
            background: linear-gradient(235 deg, #89ff00, #060c21, #060c21, #00bcd4);
        }

        .sub {
            width: 150px;
            height: 30px;
            background-color: white;
            color: crimson;
            margin: 70px 20px 20px 100px;

        }
    </style>
    <%int ratings=0; %>
    <%String employee_id=(String)request.getParameter("employee_id"); 
    System.out.println(employee_id);%>
    
    <script>
    
    	function good_emoj()
    	{
    		var review= document.getElementById("review").value;
       		
    		ratings = 5;
    	
    			window.location.href="http://localhost:8088/Bootathon2/Review_employeedb.jsp?ratings="+ratings+"&review="+review+"&employee_id=<%=employee_id%>";        
    	}
    	function nor_emoj()
    	{

    		var review= document.getElementById("review").value;
    		ratings = 3;
    		window.location.href="http://localhost:8088/Bootathon2/Review_employeedb.jsp?ratings="+ratings+"&review="+review+"&employee_id=<%=employee_id%>";      
    	}
    	function poor_emoj()
    	{

    		var review= document.getElementById("review").value;
    		ratings = 1;
    		window.location.href="http://localhost:8088/Bootathon2/Review_employeedb.jsp?ratings="+ratings+"&review="+review+"&employee_id=<%=employee_id%>";      
    	}
   
    </script>
</head>
<%@include file="nav_bar_employer.jsp" %>

<body>
    
    <%out.println(employee_id);%>
     <%@page import="java.sql.*" %>
   <%@page import="java.util.*" %>
    
    <div style="margin-top:100px" class="box">
        <div class="title">
            <div class="text">
                <h1>ADD REVIEWS</h1>
            </div>

        </div>
        <div class="content">

            <h4>

                <div >
                    <h4>Add Review:</h4><br />
                    <textarea rows="4" cols="50" name="review" id="review" placeholder="    Add Reviews..."></textarea>
                </div>
                <div class="ind">
                    <h4 style="margin-bottom:50px">Give ur Ratings:</h4><br />
                    <br />
                    
                        <div class="rating"  margin-left: -30px;">
                        	<i class="fa fa-smile-o fa-4x" aria-hidden="true" onclick="good_emoj()" ></i>
							<i class="fa fa-meh-o fa-4x" aria-hidden="true" onclick="nor_emoj()"></i>
							<i class="fa fa-frown-o fa-4x" aria-hidden="true" onclick="poor_emoj()"></i>
                        </div>
                         <button type="submit" class="sub">Submit Your Review</button>
                    
                   
                </div>


                <!-- <button onclick="rating(<%=employee_id %>)" class="btn">View</button></a> -->


        </div>
    </div>
</body>
<%

             System.out.println("Answered  "+ratings);
                            		%>
</html>