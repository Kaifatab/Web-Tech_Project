package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.EnrollmentDao;
import com.db.DBConnect;
import com.entity.Enrollment;

@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.parseInt(req.getParameter("userid"));
		String fullname = req.getParameter("fullname");
		String reg = req.getParameter("reg");
		String start_date = req.getParameter("start_date");
		String email = req.getParameter("email");
		String phn = req.getParameter("phno");
		int teacher_id = Integer.parseInt(req.getParameter("teacher"));

		Enrollment ap = new Enrollment(userId, fullname, reg, start_date, email, phn, teacher_id, "Pending");

		EnrollmentDao dao = new EnrollmentDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.addEnrollment(ap)) {
			session.setAttribute("succMsg", "Enroll Application Sent Sucessfully");
			resp.sendRedirect("student_enrollment.jsp");
		} else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("student_enrollment.jsp");
		}

	}

}
