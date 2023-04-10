package com.entity;

public class Enrollment {
	
	private int id;
	private int userId;
	private String fullName;
	private String reg;
	private String startDate;
	private String email;
	private String phnNo;
	private int teacherId;
	private String status;
	
	public Enrollment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Enrollment(int userId, String fullName, String reg, String startDate, String email, String phnNo,
			int teacherId, String status) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.reg = reg;
		this.startDate = startDate;
		this.email = email;
		this.phnNo = phnNo;
		this.teacherId = teacherId;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
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

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
