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
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	<div class="addBackground">
		<div class="addusers">
	      <form method="post" action="">
	        <input name="studentEmail" type="text" placeholder="Email" required></input>
	        <input name="studentName" type="text" placeholder="Name" required></input>
	        
	        <select name="studentFac">
	          <option value="" disabled selected hidden>Select a faculty</option>
			  <option value="foc">Faculty of Computing</option>
			  <option value="foe">Faculty of Engineering</option>
			  <option value="fob">Faculty of Business</option>
			  <option value="fohs">Faculty of Humanities and Sciences</option>
			</select>
			
	        <input name="studentNIC" type="text" placeholder="NIC" required></input>
	        
	        <select id="stuyear" class="inline-input" name="studentYear">
	          <option value="" disabled selected hidden>Select year</option>
			  <option value="1">Year 1</option>
			  <option value="2">Year 2</option>
			  <option value="3">Year 3</option>
			  <option value="4">Year 4</option>
			  <option value="PG">Post Graduate</option>
			</select>
	        
	        <select class="inline-input" name="studentSem">
	          <option value="" disabled selected hidden>Select semester</option>
			  <option value="1">Semester 1</option>
			  <option value="2">Semester 2</option>
			</select>
	        
	        <input type="submit" name="adminSub" value="Add Student"></input>
	        <input type="reset" value="Reset"></input>
	      </form>
	      <a href="student.jsp"><button>View All Students</button></a>
	    </div>
    </div>
</body>
</html>