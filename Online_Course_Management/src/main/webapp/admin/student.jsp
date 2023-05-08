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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.text-theme{
	color: #14213D !important;
}
.text-theme2{
	color: #0e0069 !important ;
}
.font{
font-family: 'Poppins', sans-serif;
}

</style>
</head>


<body class="font">
	<%@include file="navbar.jsp"%>
	<div class="w-100 container mt-5">
		<div class="w-100 shadow-lg">
			<div class="p-3">
				<p class="text-center text-warning fw-bold fs-3 py-3"> <span class="text-theme2">Student</span> Details</p>
				<table class="table">
					<thead class="table-primary">
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
							<td> <p  class="btn btn-info m-0 text-light"> <%=ap.getStatus()%> </p></td>
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