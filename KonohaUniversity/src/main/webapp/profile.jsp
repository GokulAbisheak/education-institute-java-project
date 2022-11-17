<%@page import="com.konoha.usermanagement.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="CSS/style.css">
    <script src="JavaScript\javascript.js"></script>
    
    <% 
			session = request.getSession();  
		
			if(session.getAttribute("UserType") != null)
			{
				String usertype = (String)session.getAttribute("UserType");
				String userID = (String)session.getAttribute("ID");
				
			}
			else {
				%>
				 <script>
				 	alert("You need to login first");
				 	window.location.href = "login.jsp";
				 </script>
				 <%
			}
		%>
    
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	
	<div class="profilebackground">
	
		<div class="init">
			<h1><i class="fa fa-user" aria-hidden="true"></i> Hello user - <%=(String)session.getAttribute("ID")%></h1>
			<h3>Would you like to change your password?</h3>
		</div>
		
		<form action="ChangePassword" method="post">
			<input name="id" type="text" value="<%=(String)session.getAttribute("ID")%>" hidden>
			<input type="submit" value="Yes, Change My Password">
		</form>
	</div>
	
	
</body>
</html>