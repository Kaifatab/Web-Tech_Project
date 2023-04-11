<%@page import="com.entity.Teacher"%>
<%@page import="com.dao.TeacherDao"%>
<%@page import="com.entity.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.EnrollmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Details</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>


<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Student Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Registration No</th>
							<th scope="col">Starting Date</th>
							<th scope="col">Email</th>
							<th scope="col">Contact No</th>
							<th scope="col">Teacher Name</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						EnrollmentDao dao = new EnrollmentDao(DBConnect.getConn());
						TeacherDao dao2 = new TeacherDao(DBConnect.getConn());
						List<Enrollment> list = dao.getAllEnrollment();
						for (Enrollment ap : list) {
							Teacher d = dao2.getTeacherById(ap.getTeacherId());
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getReg()%></td>
							<td><%=ap.getStartDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhnNo()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getStatus()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>