<%@page import="com.konoha.usermanagement.*"%>
<%@page import="com.konoha.modulemanagement.Module" %>
<%@page import="com.konoha.modulemanagement.ModuleDBUtil" %>
<%@page import="com.konoha.modulemanagement.ModuleDBUtil" %>
<%@page import="com.konoha.examinationmanagement.*" %>
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
				
				if(usertype.equals("Lecturer")){  
					System.out.println("access granted");
					
				} else {
					%>
					 <script>
					 	alert("Need a valid Lecturer account to access this page");
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
      	<th>Examination No</th>
        <th>Module Code</th>
        <th>Date</th>
        <th></th>
        
        <% 
        		
     	     String id1 = (String)session.getAttribute("ID");
        	 int id = Integer.parseInt(id1);
       		 ExaminationDBUtil exam = new ExaminationDBUtil();
			 ArrayList<Examination> arraylist = ExaminationDBUtil.getAllExaminationsForLIC(id);
	
			 for(Examination e1 : arraylist){
		%>
		
		<tr>
          <td><%= e1.getExamNo() %></td>
          <td><%= e1.getModuleCode() %></td>
          <td><%= e1.getExamDate() %></td>
          
          <td>
          <form method="POST" action="ExamGetForQuestions">
				<input type="hidden" name="no" value="<%=e1.getExamNo()%>"/>
				<input style="width: 100px; padding: 10px;" class="editbtn" type="submit" value= "View Questions" /> 
			</form>
        </tr>
        
        <% } %>
		
      </table>
     </div>
</body>
</html>