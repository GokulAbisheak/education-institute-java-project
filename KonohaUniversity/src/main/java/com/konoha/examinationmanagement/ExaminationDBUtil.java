package com.konoha.examinationmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.konoha.usermanagement.DBConnection;
import com.konoha.usermanagement.Lecturer;

public class ExaminationDBUtil {

	private static Examination examination;
	
	public static boolean scheduleExamination(String moduleCode, String date) {
		
		boolean success = false;
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO Examination VALUES(?, ?, ?)");
			
			stmt.setInt(1, 0);
			stmt.setString(2, moduleCode);
			stmt.setString(3, date);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0) {
				success = true;
			} else {
				success = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return success;
		
	}
	
	public static ArrayList<Examination> getAllExaminations(){
		
		ArrayList<Examination> examination = new ArrayList<Examination>();
		
		Connection conn = DBConnection.getDBConnection();
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM Examination";
			
			ResultSet rs;
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int examinationNo = rs.getInt(1);
				String moduleCode = rs.getString(2);
				String date = rs.getString(3);
				
				Examination examinationObj = new Examination(examinationNo, moduleCode, date);
				
				examination.add(examinationObj);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return examination;
	}

	public void deleteExamination(int no) {

		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM Examination WHERE ExamNo = ?");
			
			stmt.setInt(1, no);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0){
				System.out.println("Successfully Deleted");
		
			} else {
				System.out.println("Delete Unsuccessful");
			}
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}

	public Examination getExaminationByCode(int no) {
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Examination WHERE ExamNo = ?");
			
			stmt.setInt(1, no);
			
			ResultSet rs;
			
			rs = stmt.executeQuery();
			
			while(rs.next())
			{
				int ExamNo = rs.getInt("ExamNo");
				String MCode = rs.getString("MCode");
				String date = rs.getString("Date");
			
				System.out.println(ExamNo);
			
				examination = new Examination(ExamNo, MCode, date);
			
			}
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return examination;
	}

	public static boolean updateExamination(int examNo, String moduleCode, String date) {
			
			boolean success = false;
			
			Connection conn = DBConnection.getDBConnection();
			
			try {
				
				PreparedStatement stmt = conn.prepareStatement("UPDATE examination SET ExamNo = ?, MCode = ?, Date = ? WHERE ExamNo = ?");
			
				stmt.setInt(1, examNo);
				stmt.setString(2, moduleCode);
				stmt.setString(3, date);
				stmt.setInt(4, examNo);
				
				int returnValue = stmt.executeUpdate();
				
				if(returnValue != 0) {
					success = true;
				} else {
					success = false;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return success;
	}
	
	
public static ArrayList<Examination> getAllExaminationsForLIC(int id){
		
		ArrayList<Examination> examination = new ArrayList<Examination>();
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Lecturer l, Module m, Examination e WHERE m.LIC = l.ID AND e.MCode = m.MCode AND l.ID = ?");
			//String sql = "SELECT * FROM Examination";
			
			stmt.setInt(1, id);
			
			ResultSet rs;
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				int examinationNo = rs.getInt(12);
				String moduleCode = rs.getString(13);
				String date = rs.getString(14);
				
				Examination examinationObj = new Examination(examinationNo, moduleCode, date);
				
				examination.add(examinationObj);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return examination;
	}
	
	public static ArrayList<Examination> getAllExaminationsForModule(String code){
		
		ArrayList<Examination> examination = new ArrayList<Examination>();
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Examination WHERE MCode = ?");
			//String sql = "SELECT * FROM Examination";
			
			stmt.setString(1, code);
			
			ResultSet rs;
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				int examinationNo = rs.getInt(1);
				String moduleCode = rs.getString(2);
				String date = rs.getString(3);
				
				Examination examinationObj = new Examination(examinationNo, moduleCode, date);
				
				examination.add(examinationObj);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return examination;
}
}
