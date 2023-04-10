package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Enrollment;

public class EnrollmentDao {

	private Connection conn;

	public EnrollmentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addEnrollment(Enrollment ap) {

		boolean f = false;

		try {

			String sql = "insert into enroll(user_id,fullname,reg,start_date,email,phn,teacher_id,status) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFullName());
			ps.setString(3, ap.getReg());
			ps.setString(4, ap.getStartDate());
			ps.setString(5, ap.getEmail());
			ps.setString(6, ap.getPhnNo());
			ps.setInt(7, ap.getTeacherId());
			ps.setString(8, ap.getStatus());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

}
