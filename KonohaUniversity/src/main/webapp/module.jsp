<%@page import="com.konoha.usermanagement.*"%>
<%@page import="com.konoha.modulemanagement.Module" %>
<%@page import="com.konoha.modulemanagement.ModuleDBUtil" %>
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
	<a href="addmodule.jsp"><button id="addmodbtn" class="defaultbtn">Add Module</button></a>
	<div class="tabledesign">
      <table>
        <th>Module Code</th>
        <th>Module Name</th>
        <th>Faculty</th>
        <th>Year</th>
        <th>Semester</th>
        <th>LIC Registration No</th>
        <th></th>
        
        <% 
       		 ModuleDBUtil module = new ModuleDBUtil();
			 ArrayList<Module> arraylist = ModuleDBUtil.getAllModules();
	
			 for(Module m1 : arraylist){
		%>
		
		<tr>
          <td><%= m1.getModuleCode() %></td>
          <td><%= m1.getModuleName() %></td>
          <td><%= m1.getModuleFaculty() %></td>
          <td><%= m1.getModuleYear() %></td>
          <td><%= m1.getModuleSem() %></td>
          <td><%= m1.getLicId() %></td>
          
          <td>
          <form method="POST" action="ModuleGetUpdate">
				<input type="hidden" name="code" value="<%=m1.getModuleCode()%>"/>
				<input class="editbtn" type="submit" value= "Edit" /> 
			</form>
		
			<form method="POST" action="ModuleDelete">
				<input type="hidden" name="id" value="<%=m1.getModuleCode()%>"/>
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