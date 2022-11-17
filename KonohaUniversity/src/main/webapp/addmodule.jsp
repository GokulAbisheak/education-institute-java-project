<%@page import="com.konoha.usermanagement.*"%>
<%@page import="com.konoha.modulemanagement.*"%>
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
    <script defer src="JavaScript\javascript.js"></script>
    
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
	<div class="addBackground">
		<div class="addusers">
	      <form method="post" onsubmit="return validateMForm();" action="ModuleAdd">
	        <input onkeyup="validateMCode()" id="MCode" name="moduleCode" type="text" placeholder="Module Code"></input>
	        <input onkeyup="validateMName()" id="MName" name="moduleName" type="text" placeholder="Module Name"></input>
	        
	        <select onChange="validateFaculty()" id="faculty" name="moduleFac">
	          <option value="" disabled selected hidden>Select a faculty</option>
			  <option value="FOC">Faculty of Computing</option>
			  <option value="FOE">Faculty of Engineering</option>
			  <option value="FOB">Faculty of Business</option>
			  <option value="FOHS">Faculty of Humanities and Sciences</option>
			</select>
	        
	        <select onChange="validateYear2()" id="modyear" class="inline-input" name="moduleYear">
	          <option value="" disabled selected hidden>Select year</option>
			  <option value="1">Year 1</option>
			  <option value="2">Year 2</option>
			  <option value="3">Year 3</option>
			  <option value="4">Year 4</option>
			  <!--<option value="PG">Post Graduate</option>-->
			</select>
	        
	        <select id="semester" onChange="validateSemester2()" class="inline-input" name="moduleSem">
	          <option value="" disabled selected hidden>Select semester</option>
			  <option value="1">Semester 1</option>
			  <option value="2">Semester 2</option>
			</select>
			
			<select onChange="validateLIC()" id="LIC" name="moduleLIC">
	          <option value="" disabled selected hidden>Select LIC</option>
	         
				<%
					LecturerDBUtil lecturer = new LecturerDBUtil();
					ArrayList<Lecturer> arraylist = LecturerDBUtil.getAllLecturers();
				
					for(Lecturer l1 : arraylist){ 
				%>
					
					<option value="<%=l1.getId() %>"><%=l1.getId() %> - <%=l1.getName() %></option>
					
				<% } %>
	          
	          <!--
			  <option value="1">Lecturer 1</option>
			  <option value="2">Lecturer 2</option>
			  <option value="3">Lecturer 3</option>
			  <option value="4">Lecturer 4</option>
			  <option value="5">Lecturer 5</option>
			  -->
			  
			</select>
	        
	        <input type="submit" name="adminSub" value="Add Module"></input>
	        <input type="reset" value="Reset"></input>
	      </form>
	      <a href="module.jsp"><button>View All Modules</button></a>
	    </div>
    </div>
</body>
</html>