<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.konoha.modulemanagement.ModuleDBUtil" %>
<%@ page import="com.konoha.modulemanagement.Module"%>
<%@ page import="com.konoha.examinationmanagement.*"%>
<%@ page import="java.util.*" %>
 
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
				
				if(usertype.equals("Student")){  
					System.out.println("access granted");
					
				} else {
					%>
					 <script>
					 	alert("Need a valid Student account to access this page");
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
<div class="tabledesign">
	<table>
	<th>Module</th>
	<th>Exam No</th>
	<th></th>
		<% 
			 String code = request.getParameter("code");
		
       		 ExaminationDBUtil exam = new ExaminationDBUtil();
			 ArrayList<Examination> arraylist = ExaminationDBUtil.getAllExaminationsForModule(code);
	
			 for(Examination e1 : arraylist){
		%>
		
		<tr>
          <td><%= e1.getModuleCode() %></td>
          <td><%= e1.getExamNo() %></td>
          
          <td>
          <form method="POST" action="Quiz">
				<input type="hidden" name="code" value="<%=e1.getExamNo()%>"/>
				<input style="width: 200px; padding: 20px 0px; float: right; margin-right: 20px;" class="editbtn" type="submit" value= "Attempt Exam" /> 
			</form>
        </tr>
        
        <% } %>
       </table>
       </div>
</body>
</html>