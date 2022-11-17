package com.konoha.usermanagement;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class LecturerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//requesting parameters
		String id = request.getParameter("lecturerId");
		String name = request.getParameter("lecturerName");
		String faculty = request.getParameter("lecturerFac");
		String nic = request.getParameter("lecturerNIC");
		
		LecturerDBUtil.updateLecturer(id, name, nic, faculty); //call method

		//redirect
		response.sendRedirect("lecturersuccess.jsp");
		//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/lecturer.jsp");
		//dispatcher.forward(request, response);
	}

}
