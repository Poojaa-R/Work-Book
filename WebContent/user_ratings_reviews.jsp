<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://kit.fontawesome.com/44f557ccce.js"></script>
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

*{
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}
body{
    display: flex;
    height: 100vh;
}
.rev-section{
    margin: auto;
    padding: 0 1rem;
    /max-width: 1100px;/
    
    text-align: center;
}
.title{
    font-size: 2.5rem;
    text-transform: uppercase;
    color: rgba(50,50,50);
    margin-bottom: .5rem;
}
.note{
    font-size: 1.1rem;
    color: rgb(150,150,150);
}
.reviews{
    margin: 1rem auto;
    display: flex;
    flex-wrap: wrap;
}
.review{
    margin-top: 30px;
    width: max-content;
    min-width: 300px;
    flex: 1;
}
/*.head-review{
    margin: 1.75rem auto;
    width: 150px;
    height: 150px;
}*/
/*img{
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
    box-shadow: 0 10px 25px rgba(0,0,0,25);
}*/
.body-review{
    background-color: rgb(238,238,238);
    padding: 2.5rem;
    box-shadow: 2px 2px 10px 3px rgba(225,225,225);
}
.name{
    font-size: 1.5rem;
    color: rgba(50,50,50);
    margin-bottom: .25rem;
}
.place{
    color: red;
    font-style: italic;
}
.rating{
    color: rgb(253,180,42);
    margin: 1rem 0;
}
.reviews .review .body-review .desc{
    line-height: 1.5rem;
    letter-spacing: 1px;
    color: rgb(150,150,150);
    font-family: 'Poppins',sans-serif;

}
@media(max-width:678px){
    .review{
        margin-top: 1.5rem;
    }
}
</style>
</head>
<%@include file="user_profile.jsp" %>
<body>
 <%@page import="java.util.*" %>
<%int n=0; %>
<div class="rev-section" style="margin-top:50px">
       <h2 class="title">
           Reviews & Ratings
       </h2>
       <p class="note">Go through your reviews to identify your strengths and weaknesses. Feedback only makes you stronger!</p>
       <div class="reviews">
           <div class="review">
            <div class="head-review">
               <!--- <img src="person1.jfif" alt="" width="250px">
            </div>-->
            <%while(!ans.isEmpty())
            {
            	ArrayList<String> al1=ans.get(0);
            	
            	%>
            <div class="body-review">
                <div class="name">
                    <%=al1.get(3) %>
                </div>
                <div class="place">
                    <%=al1.get(4) %>
                </div>
                <% String star=al1.get(2);
                n=Integer.parseInt(star);
               
                %>
                <div class="rating">
                <%for(int i=0;i<n;i++)
                {%>
                	<i class="fas fa-star"></i>
                <%} %>
                   
                </div>
                <div class="desc-review">
                    <%=al1.get(1) %>
                </div>
            </div>
            <% ans.remove(0);} %>
            
         </div>
          
       </div>
   </div> 

</body>
</html>