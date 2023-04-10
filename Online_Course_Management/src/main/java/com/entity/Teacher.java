package com.entity;

public class Teacher {
	
	private int id;
	private String fullName;
	private String course;
	private String email;
	private String phnNo;
	private String password;

	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Teacher(String fullName,  String course, String email, String phnNo,
			String password) {
		super();
		this.fullName = fullName;
		this.course = course;
		this.email = email;
		this.phnNo = phnNo;
		this.password = password;
	}

	public Teacher(int id, String fullName, String course, String email,
			String phnNo, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.course = course;
		this.email = email;
		this.phnNo = phnNo;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhnNo() {
		return phnNo;
	}

	public void setPhnNo(String phnNo) {
		this.phnNo = phnNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
