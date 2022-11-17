package com.konoha.examinationmanagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.konoha.modulemanagement.Module;
import com.konoha.modulemanagement.ModuleDBUtil;

/**
 * Servlet implementation class GetViewExamination
 */
public class GetViewExamination extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("code");			
 		
		request.setAttribute("code", code);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam.jsp");
		dispatcher.forward(request, response); 
		
	}

}
