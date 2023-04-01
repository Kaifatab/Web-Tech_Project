package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Course;

public class CourseDao {
	
	private Connection conn;

	public CourseDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCourse(String spec) {
		boolean f = false;
		try {
			String sql = "insert into course(course_name) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, spec);

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
