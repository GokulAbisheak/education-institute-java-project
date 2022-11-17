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
		Student s1 = (Student) request.getAttribute("s1");
	%>
	
	<div class="addBackground">
		<div class="addusers">
	      <form method="post" action="StudentUpdate">
	      	<input name="studentId" type="text" value="<%=s1.getId()%>" readonly></input>
	        <input name="studentEmail" type="text" placeholder="Email" hidden></input>
	        <input name="studentName" type="text" placeholder="Name" value="<%=s1.getName()%>" required></input>
	        
	        <select name="studentFac">
	          <option value="<%=s1.getFaculty()%>"><%=s1.getFaculty()%></option>
			  <option value="FOC">Faculty of Computing</option>
			  <option value="FOE">Faculty of Engineering</option>
			  <option value="FOB">Faculty of Business</option>
			  <option value="FOHS">Faculty of Humanities and Sciences</option>
			</select>
			
	        <input name="studentNIC" type="text" placeholder="NIC" value="<%=s1.getNic()%>" required></input>
	        
	        <select id="stuyear" class="inline-input" name="studentYear">
	          <option value="<%=s1.getYear()%>"><%=s1.getYear()%></option>
			  <option value="1">Year 1</option>
			  <option value="2">Year 2</option>
			  <option value="3">Year 3</option>
			  <option value="4">Year 4</option>
			  <option value="PG">Post Graduate</option>
			</select>
	        
	        <select class="inline-input" name="studentSem">
	          <option value="<%=s1.getSemester()%>"><%=s1.getSemester()%></option>
			  <option value="1">Semester 1</option>
			  <option value="2">Semester 2</option>
			</select>
	        
	        <input type="submit" name="adminSub" value="Update Student"></input>
	        <input type="reset" value="Reset"></input>
	      </form>
	      <a href="student.jsp"><button>View All Students</button></a>
	    </div>
    </div>
</body>
</html>