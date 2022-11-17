package com.konoha.usermanagement;

import java.sql.*;

public class LoginDBUtil {
	
	private static User user = null;
	
	public static User validate(String id, String password){
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		user = null;
		
		try {
			
			//sql prepared statements
			PreparedStatement stmt1 = conn.prepareStatement("SELECT * FROM Student WHERE ID = ? AND Password = ?");
			PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM Lecturer WHERE ID = ? AND Password = ?");
			PreparedStatement stmt3 = conn.prepareStatement("SELECT * FROM Admin WHERE ID = ? AND Password = ?");
			
			//setting values to parameters
			stmt1.setString(1, id);
			stmt2.setString(1, id);
			stmt3.setString(1, id);
			
			//setting values to parameters
			stmt1.setString(2, password);
			stmt2.setString(2, password);
			stmt3.setString(2, password);
			
			ResultSet rs1, rs2, rs3;
			
			rs1 = stmt1.executeQuery();
			rs2 = stmt2.executeQuery();
			rs3 = stmt3.executeQuery();
			
			//returning the user object with values
			while(rs1.next()) {
				
				String sid = rs1.getString(1);
				String pass = rs1.getString(2);
				String name = rs1.getString(3);
				String nic = rs1.getString(4);
				String faculty = rs1.getString(5);
				int year = rs1.getInt(6);
				int sem = rs1.getInt(7);
				
				user = new Student(sid, pass, name, nic, faculty, year, sem);
			}
			
			while(rs2.next()) {
				
				String sid = rs2.getString(1);
				String pass = rs2.getString(2);
				String name = rs2.getString(3);
				String nic = rs2.getString(4);
				String faculty = rs2.getString(5);
				
				user = new Lecturer(sid, pass, name, nic, faculty);
			}
			
			while(rs3.next()) {
				
				String sid = rs3.getString(1);
				String pass = rs3.getString(2);
				String name = rs3.getString(3);
				String nic = rs3.getString(4);
				
				user = new Admin(sid, pass, name, nic);
			}
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}

		return user;
	}

	public static boolean changePassword(String id, String oldPassword, String newPassword) {
		
		//database connection
		Connection conn = DBConnection.getDBConnection();
		
		boolean success = false;
		
		try {
			
			//sql prepared statements
			PreparedStatement stmt1 = conn.prepareStatement("UPDATE Admin SET Password = ? WHERE ID = ? AND Password = ?");
			PreparedStatement stmt2 = conn.prepareStatement("UPDATE Student SET Password = ? WHERE ID = ? AND Password = ?");
			PreparedStatement stmt3 = conn.prepareStatement("UPDATE Lecturer SET Password = ? WHERE ID = ? AND Password = ?");
			
			
			//setting values to parameters
			stmt1.setString(1, newPassword);
			stmt1.setString(2, id);
			stmt1.setString(3, oldPassword);
		
			
			//executing prepared statement
			int returnValue1 = stmt1.executeUpdate();
			
			
			//validating success
			if(returnValue1 > 0) {
				
				success = true;
	
			} else {
				
				int intid = Integer.parseInt(id);
				
				//setting values to parameters
				stmt2.setString(1, newPassword);
				stmt2.setInt(2, intid);
				stmt2.setString(3, oldPassword);
				
				
				//setting values to parameters
				stmt3.setString(1, newPassword);
				stmt3.setInt(2, intid);
				stmt3.setString(3, oldPassword);
				
				int returnValue2 = stmt2.executeUpdate();
				int returnValue3 = stmt3.executeUpdate();
				
				
				if(returnValue2 > 0) {
					
					success = true;
		
				} 

				if(returnValue3 > 0) {
					
					success = true;
				
				} 
					
			}
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return success;
	}
}
