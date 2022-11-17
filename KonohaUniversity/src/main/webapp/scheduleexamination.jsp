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
	      <form method="post" onsubmit="return validateEForm();" action="ScheduleExam">
	      
	        <select id="MCode" onChange="validateMCode()" name="ModuleCode">
	          <option value="" disabled selected hidden>Select a Module</option>
			  <%
					ModuleDBUtil module = new ModuleDBUtil();
					ArrayList<Module> arraylist = ModuleDBUtil.getAllModules();
				
					for(Module m1 : arraylist){ 
				%>
					
					<option value="<%=m1.getModuleCode() %>"><%=m1.getModuleCode() %> - <%=m1.getModuleName() %></option>
					
				<% } %>
			</select>
			
			<input onChange="validateDate()" id="ExamDate" type="date" name="Date"></input>
	        
	        <input type="submit" name="" value="Schedule Examination"></input>
	        <input type="reset" value="Reset"></input>
	      </form>
	      <a href="examination.jsp"><button>View All Examinations</button></a>
	    </div>
    </div>
</body>
</html>