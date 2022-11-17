package com.konoha.questionmanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class QuestionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

 		String no = request.getParameter("no");			
		
 		
 		QuestionDBUtil question = new QuestionDBUtil();
		question.deleteQuestion(no);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/toaddquestions.jsp");
		dispatcher.forward(request, response); 
	}

}
