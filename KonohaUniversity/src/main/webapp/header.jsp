<%
session = request.getSession();  

	if(session.getAttribute("UserType") != null)
	{
		String usertype = (String)session.getAttribute("UserType");
		if(usertype.equals("Admin")){  
		 %>
			<div class="topnav" id="topnav">
			  <a class="logo" href="#home">
			      <img src="images/unilogo.png"></img>
			  </a>
			  <a href="lecturer.jsp">Lecturers</a>
			  <a href="student.jsp">Students</a>
			  <a href="module.jsp">Modules</a>
			  <a href="examination.jsp">Examination</a>
			  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
			    <i class="fa fa-bars"></i>
			  </a>
			  <div class="profileicon">
			  <i id="proic" class="fa fa-user" aria-hidden="true"></i>
			  	<div class="dropdown">
			  		<a href="profile.jsp" id="dropdowntxt">View Profile</a>
			  		<a href="logout.jsp" id="dropdowntxt">Log out</a>
				</div>
			  </div>
			  <div class="profilelink">
			  	<a href="profile.jsp">View Profile</a>
			  </div>
			  <div class="searchbar">
			    <input type="text" placeholder="Search...">
			    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
			  </div>
			</div>		 	
		 
		 <%
		} else if(usertype.equals("Lecturer")){
			%>

			  <div class="topnav" id="topnav">
			  <a class="logo" href="#home">
			      <img src="images/unilogo.png"></img>
			  </a>
			  <a href="toaddquestions.jsp">Scheduled Examinations</a>
			  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
			    <i class="fa fa-bars"></i>
			  </a>
			  <div class="profileicon">
			  <i id="proic" class="fa fa-user" aria-hidden="true"></i>
			  	<div class="dropdown">
			  		<a href="profile.jsp" id="dropdowntxt">View Profile</a>
			  		<a href="logout.jsp" id="dropdowntxt">Log out</a>
				</div>
			  </div>
			  <div class="profilelink">
			  	<a href="profile.jsp">View Profile</a>
			  </div>
			  <div class="searchbar">
			    <input type="text" placeholder="Search...">
			    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
			  </div>
			</div>		

			<%
				} else if(usertype.equals("Student")){
					%>
					
					<div class="topnav" id="topnav">
					  <a class="logo" href="#home">
					      <img src="images/unilogo.png"></img>
					  </a>
					  <a href="dashboard.jsp">Dashboard</a>
					  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
					    <i class="fa fa-bars"></i>
					  </a>
					  <div class="profileicon">
					  <i id="proic" class="fa fa-user" aria-hidden="true"></i>
					  	<div class="dropdown">
					  		<a href="profile.jsp" id="dropdowntxt">View Profile</a>
					  		<a href="logout.jsp" id="dropdowntxt">Log out</a>
						</div>
					  </div>
					  <div class="profilelink">
					  	<a href="profile.jsp">View Profile</a>
					  </div>
					  <div class="searchbar">
					    <input type="text" placeholder="Search...">
					    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
					  </div>
					</div>
					
					<%
		}
	}
	else {
		%>
		<div class="topnav" id="topnav">
		  <a class="logo" href="#home">
		      <img src="images/unilogo.png"></img>
		  </a>
		</div> 
		<%
	}
%>

<!--
<div class="topnav" id="topnav">
  <a class="logo" href="#home">
      <img src="images/unilogo.png"></img>
  </a>
  <a href="dashboard.jsp">Dashboard</a>
  <a href="lecturer.jsp">Lecturers</a>
  <a href="student.jsp">Students</a>
  <a href="module.jsp">Modules</a>
  <a href="examination.jsp">Examination</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
  <div class="profileicon">
  	<div class="dropdown">
  		<a id="dropdowntxt">View Profile</a>
  		<a id="dropdowntxt">Log out</a>
	</div>
  </div>
  <div class="profilelink">
  	<a>View Profile</a>
  </div>
  <div class="searchbar">
    <input type="text" placeholder="Search...">
    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
  </div>
</div> -->
