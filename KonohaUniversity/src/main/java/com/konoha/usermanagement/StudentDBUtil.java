package com.konoha.usermanagement;

import java.sql.*;
import java.util.*;

public class StudentDBUtil {
	
	private Student returnStudent;
	
	
	//method to add a Student
	public static boolean registerStudent(String password, String name, String nic, String faculty, int year, int semester) {
		
		boolean success = false;
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO Student VALUES(?, ?, ?, ?, ?, ?, ?)");
			
			//setting values to parameters of prepared statement
			stmt.setString(1, "0");
			stmt.setString(2, password);
			stmt.setString(3, name);
			stmt.setString(4, nic);
			stmt.setString(5, faculty);
			stmt.setInt(6, year);
			stmt.setInt(7, semester);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0) {
				
				success = true;
				
			} else {
				
				success = false;
			}
		}
		catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		return success;
	}
	
	
	//method to return all students
	public static ArrayList<Student> getAllStudents(){
		
		//Student ArrayList
		ArrayList<Student> student = new ArrayList<Student>();
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM Student";
			
			ResultSet rs;
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String id = rs.getString(1);
				String password = rs.getString(2);
				String name = rs.getString(3);
				String nic = rs.getString(4);
				String faculty = rs.getString(5);
				int year = rs.getInt(6);
				int semester = rs.getInt(7);
				
				Student studentObj = new Student(id, password, name, nic, faculty, year, semester); //calling constructor
				
				student.add(studentObj); //adding Student object to ArrayList
			}
			
		}
		catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		return student;
	}

	
	//method to update student
	public static boolean updateStudent(String id, String name, String nic, String faculty, int year, int semester) {
		
		boolean success = false;
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("UPDATE Student SET Name = ?, NIC = ?, Faculty = ?, Year = ?, Semester = ? WHERE ID = ?");
			
			//setting values to parameters of prepared statement
			stmt.setString(1, name);
			stmt.setString(2, nic);
			stmt.setString(3, faculty);
			stmt.setInt(4, year);
			stmt.setInt(5, semester);
			stmt.setString(6, id);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0) {
				
				success = true;
				
			} else {
				
				success = false;
			}
		}
		catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		return success;
		
	}
	
	
	//method to get student by ID
	public Student getStudentByID(String id) {
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Student WHERE ID = ?");
			
			//setting values to parameters of prepared statement
			stmt.setString(1, id);
			
			ResultSet rs;
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String sid = rs.getString(1);
				String password = rs.getString(2);
				String name = rs.getString(3);
				String nic = rs.getString(4);
				String faculty = rs.getString(5);
				int year = rs.getInt(6);
				int semester = rs.getInt(7);
				
				returnStudent = new Student(sid, password, name, nic, faculty, year, semester);
			}
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		return returnStudent;
	}

	
	//method to delete a student
	public void deleteStudent(String id) {
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM Student WHERE ID = ?");
			
			stmt.setString(1, id);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0){
				System.out.println("Successfully Deleted");
		
			} else {
				System.out.println("Delete Unsuccessful");
			}
			
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	
	//overloaded method to delete all students
	public void deleteStudent() {
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "DELETE FROM Student";
			
			int returnValue = stmt.executeUpdate(sql);
			
			if(returnValue != 0){
				System.out.println("Successfully Deleted");
		
			} else {
				System.out.println("Delete Unsuccessful");
			}
			
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
