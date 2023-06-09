<%@page import="com.entity.Enrollment"%>
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
<title>Comment</title>

<!-- import font from google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">


<!-- css for this file  -->
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/pexels-vlada-karpovich-4050302.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

<!-- import gobal css file -->
<%@include file="../component/allcss.jsp"%>
</head>
<body>

	<!-- redirecting teacher login page  -->
	<c:if test="${empty tchObj }">
		<c:redirect url="../teacher_login.jsp"></c:redirect>
	</c:if>

    <!-- navbar component -->
	<%@include file="navbar.jsp"%>

	<!-- enroll student component start -->
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Enroll Students</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						EnrollmentDao dao = new EnrollmentDao(DBConnect.getConn());

						Enrollment ap = dao.getEnrollmentById(id);
						%>
						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Student Name</label> <input type="text" readonly
									value="<%=ap.getFullName()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Registration No.</label> <input type="text" value="<%=ap.getReg()%>"
									readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Contact No.</label> <input type="text" readonly
									value="<%=ap.getPhnNo()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Starting Date</label> <input type="text" readonly
									value="<%=ap.getStartDate()%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" class="form-control" row="3"
									cols=""></textarea>
							</div>

							<input type="hidden" name="id" value="<%=ap.getId()%>"> <input
								type="hidden" name="did" value="<%=ap.getTeacherId()%>">

							<button class=" mt-3 btn btn-success col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- enroll student component end -->
</body>
</html>