package com.konoha.usermanagement;

public abstract class User {
	
	protected String id;
	protected String password;
	protected String name;
	protected String nic;
	
	public User(String id, String password, String name, String nic) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.nic = nic;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getNic() {
		return nic;
	}
	
	public void setNic(String nic) {
		this.nic = nic;
	}
	
	//abstract class
	public abstract String returnClass();
}

