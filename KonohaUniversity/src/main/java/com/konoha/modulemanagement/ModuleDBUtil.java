package com.konoha.modulemanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.konoha.usermanagement.DBConnection;
import com.konoha.usermanagement.Lecturer;

public class ModuleDBUtil {

	private Module module;
	public static boolean addModule(String code, String name, String faculty, String year, String semester, String lic) {
		
		boolean success = false;
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
		
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO Module VALUES(?, ?, ?, ?, ?, ?)");
			
			stmt.setString(1, code);
			stmt.setString(2, name);
			stmt.setString(3, faculty);
			stmt.setString(4, year);
			stmt.setString(5, semester);
			stmt.setString(6, lic);
			
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
	
	public static ArrayList<Module> getAllModules(){
		
		ArrayList<Module> module = new ArrayList<Module>();
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
	
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM Module";
			
			ResultSet rs;
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String moduleCode = rs.getString(1);
				String moduleName = rs.getString(2);
				String moduleFaculty = rs.getString(3);
				String moduleYear = rs.getString(4);
				String moduleSem = rs.getString(5);
				String licId = rs.getString(6);
				
				Module moduleObj = new Module(moduleCode, moduleName, moduleFaculty, moduleYear, moduleSem,licId);
				
				module.add(moduleObj);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return module;
	}

	public void deleteModule(String id) {

		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM Module WHERE MCode = ?");
			
			stmt.setString(1, id);
			
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

	public Module getModuleByCode(String code) {
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Module WHERE MCode = ?");
			
			stmt.setString(1, code);
			
			ResultSet rs;
			
			rs = stmt.executeQuery();
			
			while(rs.next())
			{
				String MCode = rs.getString("MCode");
				String MName = rs.getString("MName");
				String MFaculty = rs.getString("MFaculty");
				String MYear = rs.getString("MYear");
				String MSem = rs.getString("MSemester");
				String LIC = rs.getString("LIC");
			
				System.out.println(MCode);
			
				module = new Module(MCode, MName, MFaculty, MYear, MSem, LIC);
			
			}
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return module;
	}

	public static boolean updateModule(String code, String name, String faculty, String year, String semester, String lic) {
			
			
			boolean success = false;
			
			Connection conn = DBConnection.getDBConnection();
			
			try {
			
				PreparedStatement stmt = conn.prepareStatement("UPDATE Module SET MCode = ?, MName = ?, MFaculty = ?, MYear = ?, MSemester = ?, LIC = ? WHERE MCode = ?");
			
				stmt.setString(1, code);
				stmt.setString(2, name);
				stmt.setString(3, faculty);
				stmt.setString(4, year);
				stmt.setString(5, semester);
				stmt.setString(6, lic);
				stmt.setString(7, code);
				
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
	
	

public static ArrayList<Module> getAllModulesByFacYear(String faculty, int year){
		
		ArrayList<Module> module = new ArrayList<Module>();
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Module WHERE MFaculty = ? AND MYear = ?");
			//String sql = "SELECT * FROM Module WHERE MFaculty = ? AND MYear = ?";
			
			stmt.setString(1, faculty);
			stmt.setInt(2, year);
			
			ResultSet rs;
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String moduleCode = rs.getString(1);
				String moduleName = rs.getString(2);
				String moduleFaculty = rs.getString(3);
				String moduleYear = rs.getString(4);
				String moduleSem = rs.getString(5);
				String licId = rs.getString(6);
				
				Module moduleObj = new Module(moduleCode, moduleName, moduleFaculty, moduleYear, moduleSem,licId);
				
				module.add(moduleObj);
				System.out.println("Working 2");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("Working 3");
		return module;
		
	}
}
