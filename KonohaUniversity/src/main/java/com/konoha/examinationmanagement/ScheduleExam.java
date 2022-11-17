package com.konoha.examinationmanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.konoha.modulemanagement.ModuleDBUtil;

public class ScheduleExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("ModuleCode");
		String date = request.getParameter("Date");  
		
		
		boolean success = ExaminationDBUtil.scheduleExamination(code, date);
		
		if(success == true) {
			
			System.out.println("Added Successfully");
			response.sendRedirect("examination.jsp");
			
		} else {
			
			System.out.println("Unsuccessful Registration");
		}
	}

}
