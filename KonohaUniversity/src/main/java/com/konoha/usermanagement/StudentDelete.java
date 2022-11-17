package com.konoha.usermanagement;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class StudentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

 		String id = request.getParameter("id");	//requesting parameter	
		
 		//calling method to delete student
 		StudentDBUtil studb = new StudentDBUtil();;
		studb.deleteStudent(id);
		
		//redirecting
		response.sendRedirect("successstudent.jsp");
		//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/student.jsp");
		//dispatcher.forward(request, response); 
	}

}
