<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.TeacherDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Teacher"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Enrollment</title>

<!-- import font from google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

<!-- import gobal css file -->
<%@include file="component/allcss.jsp"%>

<!-- css for this file  -->
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/pexels-suzy-hazelwood-1122865.jpg");
	height: 32vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.font{
font-family: 'Poppins', sans-serif;
}
.text-theme{
	color: #14213D !important;
}
.text-theme2{
	color: #0e0069 !important ;
}
</style>
</head>
<body class="font">

	<!-- navbar component -->
	<%@include file="component/navbar.jsp"%>

	<!-- student Enrollment component start -->
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/Humaaans - Space.png">
			</div>

			<div class="col-md-6 my-5">
				<div class="w-100 shadow-lg">
					<div class="p-3">
						<p class="text-center text-warning fs-4 py-4 fw-bold"><span class="text-theme2">Enroll for a</span>  Course</p>

						
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if> 
						

						<form class="row g-3" action="enroll" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> 
								<input placeholder="Enter full name" required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Registration
									no.</label> <input placeholder="Enter reg. no" required type="number" class="form-control"
									name="reg">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Starting
									Date</label> <input type="date" class="form-control" required
									name="start_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email" placeholder="Enter email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno" placeholder="Enter phone number">
							</div>


							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Teacher</label> <select
									required class="form-control" name="teacher">
									<option value="">-select-</option>

									<%
									TeacherDao dao = new TeacherDao(DBConnect.getConn());
									List<Teacher> list = dao.getAllTeacher();
									for (Teacher d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getCourse()%>)
									</option>
									<%
									}
									%>




								</select>
							</div>


							<c:if test="${empty userObj }">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-warning">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-warning mt-3 text-light">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- footer component  -->
	<%@include file="component/footer.jsp"%>

</body>
</html>