<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.konoha.modulemanagement.ModuleDBUtil" %>
<%@ page import="com.konoha.modulemanagement.Module"%>
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
		<% 
       		 ModuleDBUtil module = new ModuleDBUtil();
			 ArrayList<Module> arraylist = ModuleDBUtil.getAllModulesByFacYear("FOC", 1);
	
			 for(Module m1 : arraylist){
		%>
		
		<tr>
          <td><%= m1.getModuleCode() %></td>
          <td><%= m1.getModuleName() %></td>
          
          <td>
          <form method="POST" action="GetViewExamination">
				<input type="hidden" name="code" value="<%=m1.getModuleCode()%>"/>
				<input style="width: 200px; padding: 20px 0px; float: right; margin-right: 20px;" class="editbtn" type="submit" value= "Enroll" /> 
			</form>
        </tr>
        
        <% } %>
       </table>
       </div>
</body>
</html>