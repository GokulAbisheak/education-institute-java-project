<%
	session = request.getSession();  

	session.setAttribute("UserType", null);
	session.setAttribute("ID", null);
	
	session.invalidate();
	System.out.println("logged out");
	
	response.sendRedirect("login.jsp");
%>
