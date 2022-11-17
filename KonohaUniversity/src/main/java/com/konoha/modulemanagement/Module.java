package com.konoha.modulemanagement;

public class Module {

	private String moduleCode;
	private String moduleName;
	private String moduleFaculty;
	private String moduleYear;
	private String moduleSem;
	private String licId;
	
	public Module(String moduleCode, String moduleName, String moduleFaculty, String moduleYear, String moduleSem,String licId) {
		
		this.moduleCode = moduleCode;
		this.moduleName = moduleName;
		this.moduleFaculty = moduleFaculty;
		this.moduleYear = moduleYear;
		this.moduleSem = moduleSem;
		this.licId = licId;
	}
	
	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleFaculty() {
		return moduleFaculty;
	}

	public void setModuleFaculty(String moduleFaculty) {
		this.moduleFaculty = moduleFaculty;
	}

	public String getModuleYear() {
		return moduleYear;
	}

	public void setModuleYear(String moduleYear) {
		this.moduleYear = moduleYear;
	}

	public String getModuleSem() {
		return moduleSem;
	}

	public void setModuleSem(String moduleSem) {
		this.moduleSem = moduleSem;
	}

	public String getLicId() {
		return licId;
	}

	public void setLicId(String licId) {
		this.licId = licId;
	}
	
	
	
}
