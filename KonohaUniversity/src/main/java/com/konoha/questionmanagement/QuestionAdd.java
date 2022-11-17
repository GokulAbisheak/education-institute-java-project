package com.konoha.questionmanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.konoha.modulemanagement.ModuleDBUtil;


public class QuestionAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int examno = Integer.parseInt(request.getParameter("examNo"));
		String question = request.getParameter("question");
		String option1 = request.getParameter("option1");
		String option2 = request.getParameter("option2");
		String option3 = request.getParameter("option3");
		String option4 = request.getParameter("option4");
		String answer = request.getParameter("answer");
		
		boolean success = QuestionDBUtil.addQuestion(0, examno, question, option1, option2, option3, option4, answer);
		
		if(success == true) {
			
			System.out.println("Added Successfully");
			response.sendRedirect("toaddquestions.jsp");
			
		} else {
			
			System.out.println("Unsuccessful Registration");
		}
	}
		

}
