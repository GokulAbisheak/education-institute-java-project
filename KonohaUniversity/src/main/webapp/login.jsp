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
				%>
				
					<script>
						alert("A user has already logged in.");
						window.location.href = "profile.jsp";
					</script>
				
				<%
			}

		%>
  
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	
	<div class="loginbox">
	<form method="post" action="LoginServlet">
      <input name = "regNo"type="text" placeholder="Registration Number"></input>
      <input name="password" type="password" placeholder="Password"></input>
      <input type="submit" value="Login"></input>
     </form>
    </div>
</body>
</html>