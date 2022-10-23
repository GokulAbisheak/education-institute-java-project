<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title></title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
      <link rel="stylesheet" href="CSS/style.css">
      <script src="JavaScript\javascript.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	
    <button class="themebtn" id="themebtn" onclick="changeTheme()"><i class="fa fa-moon-o"></i></button>
    <div class="leftnav">
      <button id="focbtn" class="activefacultybtn" onclick="displayIT()">Computing</button>
      <button id="foebtn" class="facultybtn" onclick="displayEN()">Engineering</button>
      <button id="fobbtn" class="facultybtn" onclick="displayBM()">Business</button>
      <button id="fohsbtn" class="facultybtn" onclick="displayHS()">Humanities and Sciences</button>
    </div>
    <div id="focdiv">
      <h1 class="facultytxt">FOC - Faculty of Computing</h1>
      <div class="selectyear">
        <button class="facultybtn">1st Year</button>
        <button class="facultybtn">2nd Year</button>
        <button class="facultybtn">3rd Year</button>
        <button class="facultybtn">4th Year</button>
        <button class="facultybtn">Post Graduate</button>
      </div>
    </div>
    <div id="foediv">
      <h1 class="facultytxt">FOE - Faculty of Engineering</h1>
      <div class="selectyear">
        <button class="facultybtn">1st Year</button>
        <button class="facultybtn">2nd Year</button>
        <button class="facultybtn">3rd Year</button>
        <button class="facultybtn">4th Year</button>
        <button class="facultybtn">Post Graduate</button>
      </div>
    </div>
    <div id="fobdiv">
      <h1 class="facultytxt">FOB - Faculty of Business</h1>
      <div class="selectyear">
        <button class="facultybtn">1st Year</button>
        <button class="facultybtn">2nd Year</button>
        <button class="facultybtn">3rd Year</button>
        <button class="facultybtn">4th Year</button>
        <button class="facultybtn">Post Graduate</button>
      </div>
    </div>
    <div id="fohsdiv">
      <h1 class="facultytxt">FOHS - Faculty of Humanities and Sciences</h1>
      <div class="selectyear">
        <button class="facultybtn">1st Year</button>
        <button class="facultybtn">2nd Year</button>
        <button class="facultybtn">3rd Year</button>
        <button class="facultybtn">4th Year</button>
        <button class="facultybtn">Post Graduate</button>
      </div>
    </div>
</body>
</html>