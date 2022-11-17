package com.konoha.usermanagement;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class LecturerDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");

 		String id = request.getParameter("id");	//receive parameter	
		
 		LecturerDBUtil studb = new LecturerDBUtil(); //create object
		studb.deleteLecturer(id); //call method
		
		//redirecting
		response.sendRedirect("lecturersuccess.jsp");
		//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/lecturer.jsp");
		//dispatcher.forward(request, response); 
	}

}
