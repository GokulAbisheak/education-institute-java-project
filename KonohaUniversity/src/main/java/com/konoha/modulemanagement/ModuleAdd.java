package com.konoha.modulemanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ModuleAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("moduleCode");
		String name = request.getParameter("moduleName");
		String faculty = request.getParameter("moduleFac");
		String year = request.getParameter("moduleYear");
		String semester = request.getParameter("moduleSem");
		String lic = request.getParameter("moduleLIC");
		
		boolean success = ModuleDBUtil.addModule(code, name, faculty, year, semester, lic);
		
		if(success == true) {
			
			System.out.println("Added Successfully");
			response.sendRedirect("module.jsp");
			
		} else {
			
			System.out.println("Unsuccessful Registration");
		}
	}

}
