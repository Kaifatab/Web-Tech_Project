<%@page import="com.entity.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.EnrollmentDao"%>
<%@page import="com.entity.Teacher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student List</title>
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
	<c:if test="${empty tchObj }">
		<c:redirect url="../teacher_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="w-100 py-4 mt-5 shadow-lg">
					<div class="p-3">
						<p class="text-center text-warning fw-bold fs-4"> <span class="text-theme2">Student</span> Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<table class="table">
							<thead class="table-primary">
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Reg No</th>
									<th scope="col">Start Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Teacher d = (Teacher) session.getAttribute("tchObj");
								EnrollmentDao dao = new EnrollmentDao(DBConnect.getConn());
								List<Enrollment> list = dao.getAllEnrollmentByTeacherLogin(d.getId());
								for (Enrollment ap : list) {
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getReg()%></td>
									<td><%=ap.getStartDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhnNo()%></td>
									<td><%=ap.getStatus()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> 
										<a href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-success btn-sm">Comment</a>
										 <%
										 } else {
										 %> 
										 <a href="#" class="btn btn-success btn-sm disabled">Comment</a> 
										 <%
										 }
										 %>
									</td>
								</tr>
								<%
								}
								%>



							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>