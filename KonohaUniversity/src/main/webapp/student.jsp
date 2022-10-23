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
        <tr>
          <td>IT21375132</td>
          <td>Gokul</td>
          <td>FOC</td>
          <td>200116400023</td>
          <td>2</td>
          <td>1</td>
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
          <td>2</td>
          <td>1</td>
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
          <td>2</td>
          <td>1</td>
          <td>
            <a href="#edit" class="editbtn">Edit</a>
            <a href="#delete" class="deletebtn">Delete</a>
          </td>
        </tr>
      </table>
     </div>
</body>
</html>