<%@page import="com.konoha.usermanagement.*"%>
<%@page import="com.konoha.modulemanagement.Module"%>
<%@page import="com.konoha.modulemanagement.ModuleDBUtil"%>
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
		Module m1 = (Module) request.getAttribute("m1");
	%>
	
	<div class="addBackground">
		<div class="addusers">
	      <form method="post" action="ModuleUpdate">
	        <input name="moduleCode" type="text" placeholder="Module Code" value="<%=m1.getModuleCode()%>" required></input>
	        <input name="moduleName" type="text" placeholder="Module Name" value="<%=m1.getModuleName()%>" required></input>
	        
	        <select name="moduleFac">
	          <option value="<%=m1.getModuleFaculty()%>"selected hidden><%=m1.getModuleFaculty()%></option>
			  <option value="FOC">Faculty of Computing</option>
			  <option value="FOE">Faculty of Engineering</option>
			  <option value="FOB">Faculty of Business</option>
			  <option value="FOHS">Faculty of Humanities and Sciences</option>
			</select>
	        
	        <select id="modyear" class="inline-input" name="moduleYear">
	          <option value="<%=m1.getModuleYear() %>" selected hidden><%=m1.getModuleYear() %></option>
			  <option value="1">Year 1</option>
			  <option value="2">Year 2</option>
			  <option value="3">Year 3</option>
			  <option value="4">Year 4</option>
			  <option value="PG">Post Graduate</option>
			</select>
	        
	        <select class="inline-input" name="moduleSem">
	          <option value="<%=m1.getModuleSem() %>" selected hidden><%=m1.getModuleSem() %></option>
			  <option value="1">Semester 1</option>
			  <option value="2">Semester 2</option>
			</select>
			
			<select name="moduleLIC">
	          <option value="<%=m1.getLicId() %>" selected hidden><%=m1.getLicId() %></option>
	         
				<%
					LecturerDBUtil lecturer = new LecturerDBUtil();
					ArrayList<Lecturer> arraylist = LecturerDBUtil.getAllLecturers();
				
					for(Lecturer l1 : arraylist){ 
				%>
					
					<option value="<%=l1.getId() %>"><%=l1.getId() %> - <%=l1.getName() %></option>
					
				<% } %>
			  
			</select>
	        
	        <input type="submit" name="" value="Update Module"></input>
	        <input type="reset" value="Reset"></input>
	      </form>
	      <a href="modules.jsp"><button>View All Modules</button></a>
	    </div>
    </div>
</body>
</html>