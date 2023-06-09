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

@WebServlet("/deleteTeacher")
public class DeleteTeacher extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		TeacherDao dao = new TeacherDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteTeacher(id)) {
			session.setAttribute("succMsg", "Doctor Delete Sucessfully..");
			resp.sendRedirect("admin/teacher.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/teacher.jsp");
		}

	}

}
