package com.entity;

public class Course {
	
	private int id;
	private String courseName;

	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Course(int id, String courseName) {
		super();
		this.id = id;
		this.courseName = courseName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String specialistName) {
		this.courseName = specialistName;
	}

}
