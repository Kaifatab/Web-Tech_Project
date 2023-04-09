package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TeacherDao;
import com.db.DBConnect;
import com.entity.Teacher;

@WebServlet("/updateTeacher")
public class UpdateTeacher extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			String fullName = req.getParameter("fullname");
			String course = req.getParameter("course");
			String email = req.getParameter("email");
			String phnno = req.getParameter("phnno");
			String password = req.getParameter("password");
			
			int id = Integer.parseInt(req.getParameter("id"));

			Teacher d = new Teacher(id, fullName, course, email, phnno, password);

			TeacherDao dao = new TeacherDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.updateTeacher(d)) {
				session.setAttribute("succMsg", "Teacher Updated Sucessfully..");
				resp.sendRedirect("admin/teacher.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("admin/teacher.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
