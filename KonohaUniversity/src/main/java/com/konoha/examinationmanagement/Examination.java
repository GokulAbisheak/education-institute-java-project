package com.konoha.examinationmanagement;


public class Examination {

	private int examNo;
	private String moduleCode;
	private String examDate;
	
	public Examination(int examNo, String moduleCode, String date) {
		
		this.examNo = examNo;
		this.moduleCode = moduleCode;
		this.examDate = date;
	}
	
	public int getExamNo() {
		return examNo;
	}

	public void setExamNo(int examNo) {
		this.examNo = examNo;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String date) {
		this.examDate = date;
	}
	
}
