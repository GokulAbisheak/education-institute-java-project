package com.konoha.usermanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LecturerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request parameters
		String password = request.getParameter("lecturerNIC");
		String name = request.getParameter("lecturerName");
		String nic = request.getParameter("lecturerNIC");
		String faculty = request.getParameter("lecturerFac");
		
		boolean success;
		
		success = LecturerDBUtil.registerLecturer(password, name, nic, faculty); //call method
		
		//validate
		if(success == true) {
			
			System.out.println("Added Successfully");
			response.sendRedirect("lecturersuccess.jsp");
			
		} else {
			
			System.out.println("Unsuccessful Registration");
		}
	}

}
