package com.konoha.usermanagement;

public class Lecturer extends User {
	
	protected String faculty;
	
	//Constructor
	public Lecturer(String id, String password, String name, String nic, String faculty) {
		super(id, password, name, nic);
		this.faculty = faculty;
	}

	public String getFaculty() {
		return faculty;
	}
	
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	
	@Override
	public String returnClass() {
		
		return "Lecturer";
	}
}
