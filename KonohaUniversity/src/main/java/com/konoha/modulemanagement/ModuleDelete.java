package com.konoha.modulemanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ModuleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

 		String id = request.getParameter("id");			
		
 		
 		ModuleDBUtil studb = new ModuleDBUtil();
		studb.deleteModule(id);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/module.jsp");
		dispatcher.forward(request, response); 
	}

}
