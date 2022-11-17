package com.konoha.usermanagement;

public class Admin extends User {

	public Admin(String id, String password, String name, String nic) {
		super(id, password, name, nic);
	}

	@Override
	public String returnClass() {
		
		return "Admin";
	}
}
