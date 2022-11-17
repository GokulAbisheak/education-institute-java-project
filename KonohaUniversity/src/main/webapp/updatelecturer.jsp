<%@page import="com.konoha.usermanagement.*"%>
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
				
				if(usertype.equals("Admin")){  
					System.out.println("access granted");
					
				} else {
					%>
					 <script>
					 	alert("Need a valid Admin account to access this page");
					 	history.back();
					 </script>
					 <%
				}
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
	
	<%
		Lecturer l1 = (Lecturer) request.getAttribute("l1");
	%>
	
	<div class="addBackground">
		<div class="addusers">
	      <form method="post" action="LecturerUpdate">
	      	<input name="lecturerId" type="text" value="<%=l1.getId()%>" readonly></input>
	        <input name="lecturerEmail" type="text" placeholder="Email" hidden></input>
	        <input name="lecturerName" type="text" placeholder="Name" value="<%=l1.getName()%>" required></input>
	        
	        <select name="lecturerFac">
	          <option value="<%=l1.getFaculty()%>"><%=l1.getFaculty()%></option>
			  <option value="FOC">Faculty of Computing</option>
			  <option value="FOE">Faculty of Engineering</option>
			  <option value="FOB">Faculty of Business</option>
			  <option value="FOHS">Faculty of Humanities and Sciences</option>
			</select>
			
	        <input name="lecturerNIC" type="text" placeholder="NIC" value="<%=l1.getNic()%>" required></input>
	        
	        
	        <input type="submit" name="adminSub" value="Update Lecturer"></input>
	        <input type="reset" value="Reset"></input>
	      </form>
	      <a href="lecturer.jsp"><button>View All Lecturers</button></a>
	    </div>
    </div>
</body>
</html>