package com.konoha.examinationmanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ModuleUpdate
 */
public class ExaminationUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ExamNo = Integer.parseInt(request.getParameter("ExamNo"));
		String mcode = request.getParameter("ModuleCode");
		String date = request.getParameter("Date");
		
		System.out.println(ExamNo);
		System.out.println(mcode);
		System.out.println(date);
		
		boolean success = ExaminationDBUtil.updateExamination(ExamNo, mcode, date);
		
		if(success == true) {
			
			System.out.println("Updated Successfully");
			response.sendRedirect("examination.jsp");
			
		} else {
			
			System.out.println("Unsuccessful Update");
		}
		
	}

}
