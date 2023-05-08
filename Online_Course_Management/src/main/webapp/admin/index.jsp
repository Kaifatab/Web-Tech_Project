<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.TeacherDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.theme-color-bg {
	background-color: 14213D;
}
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
	<c:if test="${ empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center text-warning fw-bold fs-3 pb-5"> <span class="text-theme2">Admin</span> Dashboard</p>
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		
		<%
		TeacherDao dao = new TeacherDao(DBConnect.getConn());
		%>
		
		<div class="row d-flex justify-center">
			<div class="col-md-3 p-2">
				<div class="shadow-lg p-2">
					<div class="card-body text-center ">
						<i class="fas fa-user-md fa-3x text-warning"></i><br>
						<p class="fs-5 fw-bold pt-3 text-theme2 text-center">
							Teacher 
						</p>
						<p>Total :<%=dao.countTeacher()%></p>
					</div>
				</div>
			</div>



			<div class="col-md-3 p-2">
				<div class="shadow-lg p-2">
					<div class="card-body text-center">
						<i class="fas fa-user-circle fa-3x text-warning"></i><br>
						<p class="fs-5 fw-bold pt-3 text-theme2 text-center">
							Student
						</p>
						<p>Total :<%=dao.countUSer()%></p>
					</div>
				</div>
			</div>

			<div class="col-md-3 p-2">
				<div class="shadow-lg p-2">
					<div class="card-body text-center">
						<i class="far fa-calendar-check fa-3x text-warning"></i><br>
						<p class="fs-5 fw-bold pt-3 text-theme2 text-center">
							Total Enrollment
						</p>
						<p>Total :<%=dao.countEnrollment()%></p>
					</div>
				</div>
			</div>

			<div class="col-md-3 p-2">

				<div class="shadow-lg p-2" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center">
						<i class="far fa-calendar-check fa-3x text-warning"></i><br>
						<p class="fs-5 fw-bold pt-3 text-theme2 text-center">
							Course
						</p>
						<p>Total : <%=dao.countCourse()%></p>
					</div>
				</div>

			</div>

		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addCourse" method="post">

						<div class="form-group">
							<label>Enter Course Name</label> <input type="text"
								name="courseName" class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>