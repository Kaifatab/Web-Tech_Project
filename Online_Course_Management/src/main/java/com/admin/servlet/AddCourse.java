package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CourseDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/addCourse")

public class AddCourse extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String courseName = req.getParameter("courseName");

		CourseDao dao = new CourseDao(DBConnect.getConn());
		boolean f = dao.addCourse(courseName);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succMsg", "Course Added");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/index.jsp");
		}

	}

}
