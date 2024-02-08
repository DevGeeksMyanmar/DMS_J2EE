package model;

import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    
private String name;
private String email;
private String phone;
private String role;
private String hashed_password;

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}

public String getHashed_password() {
	return hashed_password;
}
public void setHashed_password(String hashed_password) {
	this.hashed_password = hashed_password;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}





}

