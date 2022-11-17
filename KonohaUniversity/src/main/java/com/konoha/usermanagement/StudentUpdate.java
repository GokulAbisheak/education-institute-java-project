package com.konoha.usermanagement;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class StudentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//requesting parameters
		String id = request.getParameter("studentId");
		String name = request.getParameter("studentName");
		String faculty = request.getParameter("studentFac");
		String nic = request.getParameter("studentNIC");
		int year = Integer.parseInt(request.getParameter("studentYear"));
		int semester = Integer.parseInt(request.getParameter("studentSem"));
		
		
		StudentDBUtil.updateStudent(id, name, nic, faculty, year, semester); //method call to update student

		//redirecting
		response.sendRedirect("successstudent.jsp");
		//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/student.jsp");
		//dispatcher.forward(request, response);
	}

}
