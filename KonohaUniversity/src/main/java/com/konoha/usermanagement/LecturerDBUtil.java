package com.konoha.usermanagement;

import java.sql.*;
import java.util.*;

public class LecturerDBUtil {
	
	private Lecturer returnLecturer;
	
	//Method to add a lecturer
	public static boolean registerLecturer(String password, String name, String nic, String faculty) {
		
		boolean success = false;
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO Lecturer VALUES(?, ?, ?, ?, ?)");
			
			stmt.setString(1,"0");
			stmt.setString(2, password);
			stmt.setString(3,name);
			stmt.setString(4,nic);
			stmt.setString(5,faculty);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0) {
				
				success = true;
				
			} else {
				
				success = false;
				
			}
		} catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		return success;
	}
	
	
	//Method to return all Lecturers
	public static ArrayList<Lecturer> getAllLecturers(){
		
		//Lecturer ArrayList 
		ArrayList<Lecturer> lecturer = new ArrayList<Lecturer>();
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {

			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM Lecturer";
			
			ResultSet rs;
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String id = rs.getString(1);
				String password = rs.getString(2);
				String name = rs.getString(3);
				String nic = rs.getString(4);
				String faculty = rs.getString(5);
				
				Lecturer lecturerObj = new Lecturer(id, password, name, nic, faculty);
				
				lecturer.add(lecturerObj); //appending lecturer object to ArrayList
			}
			
		}
		catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		return lecturer;
	}

	
	//Method to update Lecturer
	public static boolean updateLecturer(String id, String name, String nic, String faculty) {
		
		boolean success = false;
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("UPDATE Lecturer SET Name = ?, NIC = ?, Faculty = ? WHERE ID = ?");
			
			//setting values for prepared statement parameters
			stmt.setString(1,name);
			stmt.setString(2,nic);
			stmt.setString(3,faculty);
			stmt.setString(4,id);
			
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
	
	
	//Method to get a Lecturer by ID
	public Lecturer getLecturerByID(String id) {
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Lecturer WHERE ID = ?");
			
			//setting values for prepared statement parameters
			stmt.setString(1, id);
			
			ResultSet rs;
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String sid = rs.getString(1);
				String password = rs.getString(2);
				String name = rs.getString(3);
				String nic = rs.getString(4);
				String faculty = rs.getString(5);
				
				returnLecturer = new Lecturer(sid, password, name, nic, faculty);
			}
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		return returnLecturer;
	}

	
	//Method to delete a lecturer
	public void deleteLecturer(String id) {
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM Lecturer WHERE ID = ?");
			
			//setting values for prepared statement parameters
			stmt.setString(1, id);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0){
				
				System.out.println("Successfully Deleted Lecturer");
		
			} else {
				
				System.out.println("Lecturer Delete Unsuccessful");
			}
			
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	
	//overloaded method to delete all lecturers
	public void deleteLecturer() {
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "DELETE FROM Lecturer";
			
			int returnValue = stmt.executeUpdate(sql);
			
			if(returnValue != 0){
				
				System.out.println("Successfully Deleted All Lecturers");
		
			} else {
				
				System.out.println("All Lecturer Delete Unsuccessful");
			}
			
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
