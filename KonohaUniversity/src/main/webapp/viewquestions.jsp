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
				
				if(usertype.equals("Lecturer")){  
					System.out.println("access granted");
					
				} else {
					%>
					 <script>
					 	alert("Need a valid Lecturer account to access this page");
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
		Examination e1 = (Examination) request.getAttribute("e1");
		int no = e1.getExamNo();
	%>
	<form method="post" action="QuestionGetAdd">
		<input type="text" name="no" value="<%=e1.getExamNo() %>" hidden ></input>
		<button type="submit" id="addmodbtn" class="defaultbtn">Add Questions</button>
	</form>
	<div class="tabledesign">
      <table>
      	<th>Question No</th>
        <th>Question</th>
        <th>Option 1</th>
        <th>Option 2</th>
        <th>Option 3</th>
        <th>Option 4</th>
        <th>Answer</th>
        <th></th>
        
        <% 
        	 
       		 QuestionDBUtil exam = new QuestionDBUtil();
			 ArrayList<Question> arraylist = QuestionDBUtil.getAllQuestions(no);
	
			 for(Question q1 : arraylist){
		%>
		
		<tr>
          <td><%= q1.getQuestionNo() %></td>
          <td><%= q1.getQuestion() %></td>
          <td><%= q1.getOption1() %></td>
          <td><%= q1.getOption2() %></td>
          <td><%= q1.getOption3() %></td>
          <td><%= q1.getOption4() %></td>
          <td><%= q1.getAnswer() %></td>
          
          <td>
          <form method="POST" action="QuestionGetUpdate">
				<input type="hidden" name="no" value="<%=q1.getQuestionNo()%>"/>
				<input class="editbtn" type="submit" value= "Edit" /> 
			</form>
		
			<form method="POST" action="QuestionDelete">
				<input type="hidden" name="no" value="<%=q1.getQuestionNo()%>"/>
				<input class="deletebtn" type="submit" value= "Delete" /> 
			</form>
			</td>
        </tr>
        
        <% } %>
	
      </table>
     </div>
</body>
</html>