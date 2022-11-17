package com.konoha.examinationmanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ExaminationDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

 		int no = Integer.parseInt(request.getParameter("no"));			
		
 		
 		ExaminationDBUtil examdb = new ExaminationDBUtil();
		examdb.deleteExamination(no);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/examination.jsp");
		dispatcher.forward(request, response); 
	}

}
