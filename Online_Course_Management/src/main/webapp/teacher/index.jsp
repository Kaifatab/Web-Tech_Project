<%@page import="com.entity.Teacher"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.TeacherDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Dashboard</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
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
<%@include file="../component/allcss.jsp"%>
</head>


<body class="font">
	<c:if test="${empty tchObj }">
		<c:redirect url="../teacher_login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="navbar.jsp"%>
	
	<p class="text-center text-warning fw-bold fs-4 pt-5"> <span class="text-theme2">Teacher</span> Dashboard</p>

	<%
	Teacher d = (Teacher) session.getAttribute("tchObj");
	TeacherDao dao = new TeacherDao(DBConnect.getConn());
	%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="w-100 shadow-lg py-4">
					<div class="text-center ">
						<i class="fas fa-user-md fa-3x text-warning"></i><br>
						<p class="fs-4 fw-bold pt-3 text-center text-theme2">
							Teacher 
						</p>
						<p>Total : <%=dao.countTeacher()%></p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="w-100 shadow-lg py-4">
					<div class=" text-center">
						<i class="far fa-calendar-check fa-3x text-warning"></i><br>
						<p class="fs-4 pt-3 fw-bold text-theme2 text-center">
							Total Enrollment 
						</p>
						<p>Total : <%=dao.countEnrollmentByTeacherId(d.getId())%></p>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>