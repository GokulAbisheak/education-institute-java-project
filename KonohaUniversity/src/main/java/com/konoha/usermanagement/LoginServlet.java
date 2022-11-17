package com.konoha.usermanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//requesting parameters
		String regNo = request.getParameter("regNo");
		String password = request.getParameter("password");
		User user = null;
		
		user = LoginDBUtil.validate(regNo, password); //method call to validate credential
		
		if(user == null) {
			
			System.out.println("unsuccessful login");
			response.sendRedirect("loginerror.jsp");
		}
		else {
			
			System.out.println("Successful Login");
			
			
			String userType = user.returnClass();
			System.out.println(userType);
			//identifying the user type
			if(userType.equals("Student")) {
				
				System.out.println(user.getId()+" "+user.getName()+" Student has logged in");
				
				//configuring session
				HttpSession session = request.getSession();
				session.setAttribute("UserType","Student");
				session.setAttribute("ID", user.getId());
				
				//redirecting
				response.sendRedirect("dashboard.jsp");
				
				
			} else if(userType.equals("Lecturer")) {
				
				System.out.println(user.getId()+" "+user.getName()+" Lecturer has logged in");
				
				//configuring session
				HttpSession session = request.getSession();
				session.setAttribute("UserType","Lecturer");
				session.setAttribute("ID", user.getId());
				
				//redirecting
				response.sendRedirect("toaddquestions.jsp");
				
			} else if(userType.equals("Admin")) {
				
				System.out.println(user.getId()+" "+user.getName()+" Admin has logged in");
				
				//configuring session
				HttpSession session = request.getSession();
				session.setAttribute("UserType","Admin");
				session.setAttribute("ID", user.getId());
				
				//redirecting
				response.sendRedirect("lecturer.jsp");
				
			} else {
				
				System.out.println("error");
				
				//redirecting
				response.sendRedirect("loginerror.jsp");
			}
		}
	}
}
