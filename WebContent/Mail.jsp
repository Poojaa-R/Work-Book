
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
Properties props = new Properties();    
props.put("mail.smtp.host", "smtp.gmail.com");    
props.put("mail.smtp.socketFactory.port", "465");    
props.put("mail.smtp.socketFactory.class",    
          "javax.net.ssl.SSLSocketFactory");    
props.put("mail.smtp.auth", "true");    
props.put("mail.smtp.port", "465");    
//get Session   
Session sessio = Session.getInstance(props,    
 new javax.mail.Authenticator() 
 {    
 protected PasswordAuthentication getPasswordAuthentication() 
 {    
 return new PasswordAuthentication("buspermitticket@gmail.com","buspermit123");  
 }    
});    
//compose message 
String email="18eucs080@skcet.ac.in";
String subject="Ticket Confirmation";
StringBuilder sb=new StringBuilder();
sb.append("Your daily Bus Permit has been generated and here are your ticket details,");
sb.append("\n");
sb.append("\n");
sb.append("-------------------------------------------------");
sb.append("\n");
sb.append("Name:"+ " Pranesh M");
sb.append("\n");
sb.append("Date:"+ " 07/02/2021");
sb.append("\n");
sb.append("Time limit:"+ " Pranesh M");
sb.append("\n");
sb.append("Pass type:"+ " Pranesh M");
sb.append("\n");
sb.append("Ticket number:"+ " Pranesh M");
sb.append("\n");
sb.append("Generated time:"+ " Pranesh M");
sb.append("\n");
sb.append("Ends in:"+ " Pranesh M");
sb.append("\n");
sb.append("-------------------------------------------------");
String m=new String(sb);
try {    
 MimeMessage message = new MimeMessage(sessio);    
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(email));    
 message.setSubject(subject);    
 message.setText(m);    
 Transport.send(message); 
 System.out.println("message sent successfully");    
} catch (MessagingException e) {throw new RuntimeException(e);
}    

%>
</body>
</html>