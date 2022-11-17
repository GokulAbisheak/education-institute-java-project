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
	<a href="scheduleexamination.jsp"><button id="addmodbtn" class="defaultbtn">Schedule Examination</button></a>
	<div class="tabledesign">
      <table>
      	<th>Examination No</th>
        <th>Module Code</th>
        <th>Date</th>
        <th></th>
        
        <% 
       		 ExaminationDBUtil exam = new ExaminationDBUtil();
			 ArrayList<Examination> arraylist = ExaminationDBUtil.getAllExaminations();
	
			 for(Examination e1 : arraylist){
		%>
		
		<tr>
          <td><%= e1.getExamNo() %></td>
          <td><%= e1.getModuleCode() %></td>
          <td><%= e1.getExamDate() %></td>
          
          <td>
          <form method="POST" action="ExaminationGetUpdate">
				<input type="hidden" name="no" value="<%=e1.getExamNo()%>"/>
				<input class="editbtn" type="submit" value= "Edit" /> 
			</form>
		
			<form method="POST" action="ExaminationDelete">
				<input type="hidden" name="no" value="<%=e1.getExamNo()%>"/>
				<input class="deletebtn" type="submit" value= "Delete" /> 
			</form>
			</td>
        </tr>
        
        <% } %>
		
        <!--
        <tr>
          <td>IT2040</td>
          <td>Data Science</td>
          <td>FOC</td>
          <td>2</td>
          <td>1</td>
          <td>S0001</td>
          <td>Kamal</td>
          <td>
            <a href="#edit" class="editbtn">Edit</a>
            <a href="#delete" class="deletebtn">Delete</a>
          </td>
        </tr>
        <tr>
          <td>IT2040</td>
          <td>Data Science</td>
          <td>FOC</td>
          <td>2</td>
          <td>1</td>
          <td>S0001</td>
          <td>Kamal</td>
          <td>
            <a href="#edit" class="editbtn">Edit</a>
            <a href="#delete" class="deletebtn">Delete</a>
          </td>
        </tr>
        <tr>
          <td>IT2040</td>
          <td>Data Science</td>
          <td>FOC</td>
          <td>2</td>
          <td>1</td>
          <td>S0001</td>
          <td>Kamal</td>
          <td>
            <a href="#edit" class="editbtn">Edit</a>
            <a href="#delete" class="deletebtn">Delete</a>
          </td>
        </tr>
        -->
      </table>
     </div>
</body>
</html>