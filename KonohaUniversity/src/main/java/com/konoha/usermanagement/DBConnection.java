package com.konoha.usermanagement;
import java.sql.*;

public class DBConnection {
	
	static Connection conn = null;
	
	private DBConnection() {
		
	}
	
	public static Connection getDBConnection(){
		
		try {
			
			if(conn == null) {
				
				Class.forName("com.mysql.jdbc.Driver");
				
				String url = "jdbc:mysql://localhost:3306/KonohaUniversity?verifyServerCertificate=false&useSSL=true";
				String un = "root";
				String pwd = "default123";
				
				conn = DriverManager.getConnection(url, un, pwd);
				
			}
			
		} catch(SQLException | ClassNotFoundException e){
			
			e.printStackTrace();
		}
		return conn;
	}
	
}
