<%@page import="com.konoha.usermanagement.*"%>
<%@page import="com.konoha.modulemanagement.Module" %>
<%@page import="com.konoha.modulemanagement.ModuleDBUtil" %>
<%@page import="com.konoha.modulemanagement.ModuleDBUtil" %>
<%@page import="com.konoha.examinationmanagement.*" %>
<%@page import="com.konoha.questionmanagement.*" %>
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
	<% 
		int no = (Integer)request.getAttribute("examno");
	%>
	<div style = "padding: 20px; height: auto; font-size: 20px;"class="addBackground">
	<div class="addusers">
	<form method="post" action="FinishAttempt">
        
        <% 
        	 
       		 QuestionDBUtil exam = new QuestionDBUtil();
			 ArrayList<Question> arraylist = QuestionDBUtil.getAllQuestions(no);
			 
			 int i = 0;
			 
			 for(Question q1 : arraylist){
				 
		%>
		
		<p style="font-size: 20px;"><%=q1.getQuestion() %></p><br>
		<input style="width: 15px; height: 15px; margin: 5px;" type="radio" name="<%=i%>" value="<%=q1.getOption1() %>">&nbsp&nbsp<%=q1.getOption1() %><br>
		<input style="width: 15px; height: 15px; margin: 5px;" type="radio" name="<%=i%>" value="<%=q1.getOption2() %>">&nbsp&nbsp<%=q1.getOption2() %><br>
		<input style="width: 15px; height: 15px; margin: 5px;" type="radio" name="<%=i%>" value="<%=q1.getOption3() %>">&nbsp&nbsp<%=q1.getOption3() %><br>
		<input style="width: 15px; height: 15px; margin: 5px;" type="radio" name="<%=i%>" value="<%=q1.getOption4() %>">&nbsp&nbsp<%=q1.getOption4() %><br><br><br>
        <input name="doneby" value='<%=(String)session.getAttribute("ID")%>' hidden>
        <%
        	i++;
			 } %>
			 
			 <button value="Finish Attempt" type="submit">Finish Attempt</button>
	</form>
      </div>
      </div>
</body>
</html>