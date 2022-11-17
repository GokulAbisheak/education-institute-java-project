package com.konoha.usermanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class StudentGetUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

 		String id = request.getParameter("id");	//requesting parameter		
		
 		//getting student object for update
 		StudentDBUtil studb = new StudentDBUtil();
		Student s1 = studb.getStudentByID(id);
		
		//redirecting to update page with object
		request.setAttribute("s1", s1);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/updatestudent.jsp");
		dispatcher.forward(request, response); 
	}

}
