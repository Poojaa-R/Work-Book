<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%@page import="java.util.*" %>
<style>
body{
    margin: 0;
    padding: 0;
    background: #262626;
}
.rating{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%) rotateY(180deg);
    display: flex;
}
.rating input{
    display: none;
}
.rating label{
    display: block;
    cursor: pointer;
    width: 50px;
    background: #ccc;
}
.rating label:before{
    content: '\f005';
    font-family: fontAwesome;
    position: absolute;
    display: block;
    font-size: 50px;
    color: #101010;
   
}
.rating label:after{
    content: '\f005';
    font-family: fontAwesome;
    position: absolute;
    display: block;
    font-size: 50px;
    color: gold;
    top: 0;
    opacity: 0;
    transition: .5s;
    text-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}
.rating label:hover:after,
.rating label:hover~label:after,
.rating input:checked~label:after{
    opacity: 1;
}
</style>
<body>
<form action="Ratings.jsp">
<div class="rating">

             <input type="radio" name="star1" id="star1"><label for="star1"></label>
             <input type="radio" name="star2" id="star2"><label for="star2"></label>
             <input type="radio" name="star3" id="star3"><label for="star3"></label>
             <input type="radio" name="star4" id="star4"><label for="star4"></label>
             <input type="radio" name="star5" id="star5"><label for="star5"></label>
			
		
         </div>
         </form>
</body>
<%
	String r1=request.getParameter("star1");
	String r2=request.getParameter("star2");
    String r3=request.getParameter("star3");
    String r4=request.getParameter("star4");
    String r5=request.getParameter("star5");
    int flag=0,ratings=0;
    if(r5=="on")
    {
    	ratings=5;
    	flag=1;
    }
    if(r4=="on" && flag==0)
    {
    	ratings=4;
    	flag=1;
    }
    if(r3=="on" && flag==0)
    {
    	System.out.println("block");
    	ratings=3;
    	flag=1;
    }
    if(r2=="on" && flag==0)
    {
    	ratings=2;
    	flag=1;
    }
    if(r1=="on" && flag==0)
    {
    	ratings=1;
    	flag=1;
    }
	System.out.println(ratings);
    
%>
</html>