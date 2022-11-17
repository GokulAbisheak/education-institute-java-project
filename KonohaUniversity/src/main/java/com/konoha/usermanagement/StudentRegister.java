package com.konoha.usermanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class StudentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//requesting parameters
		String password = request.getParameter("studentNIC");
		String name = request.getParameter("studentName");
		String nic = request.getParameter("studentNIC");
		String faculty = request.getParameter("studentFac");
		int year = Integer.parseInt(request.getParameter("studentYear"));
		int semester = Integer.parseInt(request.getParameter("studentSem"));
		
		boolean success;
		
		success = StudentDBUtil.registerStudent(password, name, nic, faculty, year, semester); //method call to add student
		
		//validating
		if(success == true) {
			
			System.out.println("Added Successfully");
			response.sendRedirect("successstudent.jsp");
			
		} else {
			
			System.out.println("Unsuccessful Registration");
			response.sendRedirect("student.jsp");
		}
	}

}
