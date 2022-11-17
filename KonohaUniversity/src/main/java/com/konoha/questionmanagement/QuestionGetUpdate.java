package com.konoha.questionmanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.konoha.modulemanagement.Module;
import com.konoha.modulemanagement.ModuleDBUtil;

public class QuestionGetUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));			
		
 		QuestionDBUtil studb = new QuestionDBUtil();
 		Question q1 = studb.getQuestionByNo(no);
		
		request.setAttribute("q1", q1);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/updatequestion.jsp");
		dispatcher.forward(request, response); 
		
	}

}
