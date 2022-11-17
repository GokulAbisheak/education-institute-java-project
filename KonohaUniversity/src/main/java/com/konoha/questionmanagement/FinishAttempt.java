package com.konoha.questionmanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class FinishAttempt
 */
public class FinishAttempt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q1 = request.getParameter("0");
		String q2 = request.getParameter("1");
		String q3 = request.getParameter("2");
		int doneby = Integer.parseInt(request.getParameter("doneby"));
		
		boolean success = QuestionDBUtil.attemptExam(q1, q2, q3, doneby);		
		
		if(success == true) {
			System.out.println("Success");
			response.sendRedirect("dashboard.jsp");
			
		} else {
			System.out.println("Unsuccessful");
		}
		
		
	}

}
