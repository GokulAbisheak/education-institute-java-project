package com.konoha.usermanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id"); //requesting parameter
		
		request.setAttribute("id", id); //setting attribute
		
		//redirecting to change password ui with parameter
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/changepassword.jsp"); 
		dispatcher.forward(request, response); 
	
	}

}
