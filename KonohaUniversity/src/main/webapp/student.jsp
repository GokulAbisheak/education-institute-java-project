<%@page import="com.konoha.usermanagement.*"%>
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
	<a href="addstudent.jsp"><button id="addstubtn" class="defaultbtn">Add Student</button></a>
	<div class="tabledesign">
      <table>
        <th>Registration No</th>
        <th>Name</th>
        <th>Faculty</th>
        <th>NIC</th>
        <th>Year</th>
        <th>Semester</th>
        <th></th>
        
        <%
       		StudentDBUtil student = new StudentDBUtil();
			ArrayList<Student> arraylist = StudentDBUtil.getAllStudents();
		
			for(Student s1 : arraylist){
        
        %>
        <tr>
          <td><%=s1.getId() %></td>
          <td><%=s1.getName() %></td>
          <td><%=s1.getFaculty() %></td>
          <td><%=s1.getNic() %></td>
          <td><%=s1.getYear() %></td>
          <td><%=s1.getSemester() %></td>
          <td>
            <form method="POST" action="StudentGetUpdate">
				<input type="hidden" name="id" value="<%=s1.getId()%>"/>
				<input class="editbtn" type="submit" value= "Edit" /> 
			</form>
		
			<form method="POST" action="StudentDelete">
				<input type="hidden" name="id" value="<%=s1.getId()%>"/>
				<input class="deletebtn" type="submit" value= "Delete" /> 
			</form>
          </td>
        </tr>
        <%
        	} 
        %>
      </table>
     </div>
</body>
</html>