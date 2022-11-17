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
	<a href="addlecturer.jsp"><button id="addlecbtn" class="defaultbtn">Add Lecturer</button></a>
	<div class="tabledesign">
      <table>
        <th>Registration No</th>
        <th>Name</th>
        <th>Faculty</th>
        <th>NIC</th>
        <th></th>
        <%
       		LecturerDBUtil lecturer = new LecturerDBUtil();
			ArrayList<Lecturer> arraylist = LecturerDBUtil.getAllLecturers();
		
			for(Lecturer l1 : arraylist){
        
        %>
        <tr>
          <td><%=l1.getId() %></td>
          <td><%=l1.getName() %></td>
          <td><%=l1.getFaculty() %></td>
          <td><%=l1.getNic() %></td>
          <td>
            <form method="POST" action="LecturerGetUpdate">
				<input type="hidden" name="id" value="<%=l1.getId()%>"/>
				<input class="editbtn" type="submit" value= "Edit" /> 
			</form>
		
			<form method="POST" action="LecturerDelete">
				<input type="hidden" name="id" value="<%=l1.getId()%>"/>
				<input class="deletebtn" type="submit" value= "Delete" /> 
			</form>
          </td>
        </tr>
        <%
        	} 
        %>
        <!-- 
        <tr>
          <td>IT21375132</td>
          <td>Gokul</td>
          <td>FOC</td>
          <td>200116400023</td>
          <td>
            <a href="#edit" class="editbtn">Edit</a>
            <a href="#delete" class="deletebtn">Delete</a>
          </td>
        </tr>
        <tr>
          <td>IT21375132</td>
          <td>Gokul</td>
          <td>FOC</td>
          <td>200116400023</td>
          <td>
            <a href="#edit" class="editbtn">Edit</a>
            <a href="#delete" class="deletebtn">Delete</a>
          </td>
        </tr>
        <tr>
          <td>IT21375132</td>
          <td>Gokul</td>
          <td>FOC</td>
          <td>200116400023</td>
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