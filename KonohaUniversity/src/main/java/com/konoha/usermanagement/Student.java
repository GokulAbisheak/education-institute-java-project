package com.konoha.usermanagement;

public class Student extends User {
	
	protected String faculty;
	protected int year;
	protected int semester;
	
	//constructor
	public Student(String id, String password, String name, String nic, String faculty, int year, int semester) {
		
		super(id, password, name, nic);
		
		this.faculty = faculty;
		this.year = year;
		this.semester = semester;
	}

	public String getFaculty() {
		return faculty;
	}
	
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	
	public int getYear() {
		return year;
	}
	
	public void setYear(int year) {
		this.year = year;
	}
	
	public int getSemester() {
		return semester;
	}
	
	public void setSemester(int semester) {
		this.semester = semester;
	}
	
	@Override
	public String returnClass() {
		
		return "Student";
	}
}
