package com.konoha.questionmanagement;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.konoha.examinationmanagement.*;

public class ExamGetForQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

 		int no = Integer.parseInt(request.getParameter("no"));			
		
 		
 		ExaminationDBUtil studb = new ExaminationDBUtil();
 		Examination e1 = studb.getExaminationByCode(no);
		
 		
		request.setAttribute("e1", e1);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewquestions.jsp");
		dispatcher.forward(request, response); 
	}

}
