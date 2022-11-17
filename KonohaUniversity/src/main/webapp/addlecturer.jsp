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
	      <form method="post" onsubmit="return validateLForm();" action="LecturerRegister">
	        
	        <input onkeyup="validateName()" name="lecturerName" id="inputname" type="text" placeholder="Name"></input>
	        
	        <select id="faculty" onChange="validateFaculty()" name="lecturerFac">
	          <option value="" disabled selected hidden>Select a faculty</option>
			  <option value="FOC">Faculty of Computing</option>
			  <option value="FOE">Faculty of Engineering</option>
			  <option value="FOB">Faculty of Business</option>
			  <option value="FOHS">Faculty of Humanities and Sciences</option>
			</select>
			
	        <input id="nic" onkeyup="validateNIC()" name="lecturerNIC" type="text" placeholder="NIC"></input>
	        
	        <input type="submit" name="adminSub" value="Add Lecturer"></input>
	        <input type="reset" value="Reset"></input>
	      </form>
	      <a href="student.jsp"><button>View All Lecturers</button></a>
	    </div>
    </div>
</body>
</html>