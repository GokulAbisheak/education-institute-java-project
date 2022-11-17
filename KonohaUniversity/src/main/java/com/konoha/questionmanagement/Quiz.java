package com.konoha.questionmanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Quiz
 */
public class Quiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int examno = Integer.parseInt(request.getParameter("code"));
		System.out.println(examno);
		
		
		
		request.setAttribute("examno", examno);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/attemptexam.jsp");
		dispatcher.forward(request, response); 
		
	}

}
