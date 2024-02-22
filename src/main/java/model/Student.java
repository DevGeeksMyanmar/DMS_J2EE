package model;

import java.io.Serializable;

public class Student implements Serializable {
    private static final long serialVersionUID = 1L;
private int id;
private String name;
private String rollno;
private String email;

public int getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRollno() {
	return rollno;
}
public void setRollno(String rollno) {
	this.rollno = rollno;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
}

