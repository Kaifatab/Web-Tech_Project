<%@page import="com.entity.User"%>
<%@page import="com.entity.Teacher"%>
<%@page import="com.dao.TeacherDao"%>
<%@page import="com.entity.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.EnrollmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Enrollment</title>

<!-- import font from google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

<!-- import gobal css file -->
<%@include file="component/allcss.jsp"%>

<!-- css for this file  -->
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/pexels-suzy-hazelwood-1122865.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
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
.mt100{
margin-top:150px
}

</style>
</head>


<body class="font">

	<!-- redirecting user login page  -->
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<!-- navbar component -->
	<%@include file="component/navbar.jsp"%>

	<!-- Enrollment list component start -->
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-8">
				<div class="">
					<div class="mt100 shadow-lg py-4">
						<p class="fs-5 fw-bold text-center text-theme2">Enrollment
							List</p>
						<table class="table">
							<thead class="table-primary">
								<tr class="mx-3">
									<th class="text-center" scope="col">Full Name</th>
									<th scope="col">Reg. No</th>
									<th scope="col">Start Date</th>
									<th scope="col">Teacher</th>
									<th scope="col">Status</th>

								</tr>
							</thead>

							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								EnrollmentDao dao = new EnrollmentDao(DBConnect.getConn());
								TeacherDao dao2 = new TeacherDao(DBConnect.getConn());
								List<Enrollment> list = dao.getAllEnrollmentByLoginUser(user.getId());
								for (Enrollment ap : list) {
									Teacher d = dao2.getTeacherById(ap.getTeacherId());
								%>
								<tr>
									<td class="text-center"><%=ap.getFullName()%></th>
									<td ><%=ap.getReg()%></td>
									<td><%=ap.getStartDate()%></td>
									<td><%=d.getFullName()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
                                        } else {
                                        %> <%=ap.getStatus()%> <%
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

			<div class="col-md-4 p-4">
				<img class="w-100" alt="" src="img/Allura - Giant Phone.png">
			</div>
		</div>
	</div>
	<!-- Enrollment list component end -->

</body>
</html>