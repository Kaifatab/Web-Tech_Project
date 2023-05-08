package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import com.entity.Teacher;

public class TeacherDao {

	private Connection conn;

	public TeacherDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerTeacher(Teacher d) {

		boolean f = false;

		try {
			String sql = "insert into teacher(full_name,course,email,phnno,password) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getCourse());
			ps.setString(3, d.getEmail());
			ps.setString(4, d.getPhnNo());
			ps.setString(5, d.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Teacher> getAllTeacher() {
		List<Teacher> list = new ArrayList<Teacher>();
		Teacher d = null;
		try {

			String sql = "select * from teacher order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Teacher();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setCourse(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setPhnNo(rs.getString(5));
				d.setPassword(rs.getString(6));
				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Teacher getTeacherById(int id) {
		Teacher d = null;
		try {

			String sql = "select * from teacher where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Teacher();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setCourse(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setPhnNo(rs.getString(5));
				d.setPassword(rs.getString(6));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}

	public boolean updateTeacher(Teacher d) {

		boolean f = false;

		try {
			String sql = "update teacher set full_name=?,course=?,email=?,phnno=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getCourse());
			ps.setString(3, d.getEmail());
			ps.setString(4, d.getPhnNo());
			ps.setString(5, d.getPassword());
			ps.setInt(6, d.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteTeacher(int id) {
		boolean f = false;
		try {
			String sql = "delete from teacher where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public Teacher login(String email, String psw) {

		Teacher d = null;

		try {

			String sql = "select * from teacher where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Teacher();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setCourse(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setPhnNo(rs.getString(5));
				d.setPassword(rs.getString(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}
	
	public int countTeacher() {
		int i = 0;
		try {
			String sql = "select * from teacher";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public int countEnrollment() {
		int i = 0;
		try {
			String sql = "select * from enroll";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public int countEnrollmentByTeacherId(int did) {
		int i = 0;
		try {
			String sql = "select * from enroll where teacher_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public int countUSer() {
		int i = 0;
		try {
			String sql = "select * from user_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public int countCourse() {
		int i = 0;
		try {
			String sql = "select * from course";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from teacher where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update teacher set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean editDoctorProfile(Teacher d) {
		boolean f = false;

		try {
			String sql = "update teacher set full_name=?,course=?,email=?,phnno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(4, d.getCourse());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getPhnNo());
			ps.setInt(7, d.getId());
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
