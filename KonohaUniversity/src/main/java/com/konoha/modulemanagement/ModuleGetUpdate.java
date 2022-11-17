package com.konoha.modulemanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ModuleGetUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

 		String code = request.getParameter("code");			
		
 		
 		ModuleDBUtil studb = new ModuleDBUtil();
 		Module m1 = studb.getModuleByCode(code);
		
 		
		request.setAttribute("m1", m1);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/updatemodule.jsp");
		dispatcher.forward(request, response); 
	}

}
