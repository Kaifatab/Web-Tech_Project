package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<Enrollment> getAllEnrollmentByLoginUser(int userId) {
		List<Enrollment> list = new ArrayList<Enrollment>();
		Enrollment ap = null;

		try {

			String sql = "select * from enroll where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Enrollment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setReg(rs.getString(4));
				ap.setStartDate(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setPhnNo(rs.getString(7));
				ap.setTeacherId(rs.getInt(8));
				ap.setStatus(rs.getString(9));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<Enrollment> getAllEnrollmentByTeacherLogin(int teacherId) {
		List<Enrollment> list = new ArrayList<Enrollment>();
		Enrollment ap = null;

		try {

			String sql = "select * from enroll where teacher_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, teacherId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Enrollment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setReg(rs.getString(4));
				ap.setStartDate(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setPhnNo(rs.getString(7));
				ap.setTeacherId(rs.getInt(8));
				ap.setStatus(rs.getString(9));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public Enrollment getEnrollmentById(int id) {
		
		Enrollment ap = null;
		
		try {

			String sql = "select * from enroll where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Enrollment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setReg(rs.getString(4));
				ap.setStartDate(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setPhnNo(rs.getString(7));
				ap.setTeacherId(rs.getInt(8));
				ap.setStatus(rs.getString(9));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ap;
	}
	
	public boolean updateCommentStatus(int id, int tchId, String comm) {
		boolean f = false;
		try {
			String sql = "update enroll set status=? where id=? and teacher_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, tchId);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public List<Enrollment> getAllEnrollment() {
		List<Enrollment> list = new ArrayList<Enrollment>();
		Enrollment ap = null;

		try {

			String sql = "select * from enroll order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Enrollment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setReg(rs.getString(4));
				ap.setStartDate(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setPhnNo(rs.getString(7));
				ap.setTeacherId(rs.getInt(8));
				ap.setStatus(rs.getString(9));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
