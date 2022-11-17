package com.konoha.usermanagement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/StudentRegister")
public class StudentRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String password = request.getParameter("studentNIC");
		String name = request.getParameter("studentName");
		String nic = request.getParameter("studentNIC");
		String faculty = request.getParameter("studentFac");
		int year = Integer.parseInt(request.getParameter("studentYear"));
		int semester = Integer.parseInt(request.getParameter("studentSem"));
		
		boolean success;
		
		success = StudentDBUtil.registerStudent(password, name, nic, faculty, year, semester);
		
		if(success == true) {
			
			System.out.println("Added Successfully");
			RequestDispatcher redirect = request.getRequestDispatcher("student.jsp");
			redirect.forward(request, response);
			
		} else {
			
			System.out.println("Unsuccessful Registration");
		}
	}

};
