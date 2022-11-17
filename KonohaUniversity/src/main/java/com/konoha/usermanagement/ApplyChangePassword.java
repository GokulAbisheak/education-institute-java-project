package com.konoha.usermanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ApplyChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("ID");
		String oldPassword = request.getParameter("OldPassword");
		String newPassword = request.getParameter("NewPassword");
		
		boolean success = LoginDBUtil.changePassword(id, oldPassword, newPassword);
		
		if(success == false)
		{
			System.out.println("Password Change unsuccessful");
			response.sendRedirect("passwordchangeerror.jsp");
			
		}
		else
		{
			System.out.println("Password Changed Successfully");
			response.sendRedirect("passwordchanged.jsp");
		}
	}

}
