
     <%@ page import="java.sql.*"%>
       <%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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

int jobid=0;
loadDriver(dbDriver);
Connection con=getConnection();
String sql="update job_status set employer_acceptance_status=1 where jobstatus_id=?";
try
{
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1, Integer.parseInt(request.getParameter("status_id")));
ps.executeUpdate();
 
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
String sql_job="select job_id from job_status where jobstatus_id=?";
try
{
PreparedStatement ps=con.prepareStatement(sql_job);
ps.setInt(1, Integer.parseInt(request.getParameter("status_id")));
ResultSet rs=ps.executeQuery();

	while(rs.next())
	{
		jobid=rs.getInt("job_id");
	}
 
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
String jobupdate="Update job_post Set no_of_people = no_of_people-1 where job_id=?";
try
{
PreparedStatement ps=con.prepareStatement(jobupdate);
ps.setInt(1,jobid);
ps.executeUpdate(); 
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}

String name=(String)request.getParameter("employee_name");
String company_name="";
String employer_id=(String)session.getAttribute("employer_id");
System.out.println(employer_id);
String sql1="select * from employer where employer_id=?";
try
{
PreparedStatement ps=con.prepareStatement(sql1);
ps.setString(1,employer_id);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	company_name=rs.getString("company_name");
}
//System.out.println(name);
//System.out.println(company_name);
ps.executeUpdate();
 
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
%>

 <%
Properties props = new Properties();    
props.put("mail.smtp.host", "smtp.gmail.com");    
props.put("mail.smtp.socketFactory.port", "465");    
props.put("mail.smtp.socketFactory.class",    
          "javax.net.ssl.SSLSocketFactory");    
props.put("mail.smtp.auth", "true");    
props.put("mail.smtp.port", "465");    
//get Session   
Session sessio = Session.getInstance(props,    
 new javax.mail.Authenticator() {    
 protected PasswordAuthentication getPasswordAuthentication() {    
 return new PasswordAuthentication("bootathon2@gmail.com","1234ABcd");  
 }    
});    
//compose message 
String email=request.getParameter("email"); 
String subject="Congratulations on landing a job - WORKBOOK";
StringBuilder sb=new StringBuilder();
sb.append("Congratulations");
sb.append(" "+name);
sb.append("\n");
sb.append("  "+"You have been selected by " +company_name+ " for the freelancer job that you had applied to. Get in touch with your employer as soon as possible and kick start your project !!");
sb.append("\n");
sb.append("Be sure to earn good ratings and reviews from your employer to attract more projects as such. ");
sb.append("\n");
sb.append("We look forward to having you back. All the best.");
sb.append("\n");
sb.append("Cheers,");
sb.append("\n");
sb.append("All of us at WORKBOOK.");
String m=new String(sb);
int flag=0;
try {    
 MimeMessage message = new MimeMessage(sessio);    
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(email));    
 message.setSubject(subject);    
 message.setText(m);    
 //send message  
 if(flag==0)
 {
 Transport.send(message); 
 flag=1;
 }
 System.out.println("message sent successfully");    
} catch (MessagingException e) {throw new RuntimeException(e);}    

%>
<%
if(flag==1)
{
	response.sendRedirect("Email_success.jsp");
}
%>
</body>
</html>