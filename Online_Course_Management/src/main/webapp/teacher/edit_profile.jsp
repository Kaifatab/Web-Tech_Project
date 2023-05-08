<%@page import="com.entity.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
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
<%@include file="../component/allcss.jsp"%>
</head>
<body class="font">
	<c:if test="${empty tchObj }">
		<c:redirect url="../teacher_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="w-75 shadow-lg d-flex mt-5 mx-auto">
		    <div  class="w-50">
		     <img class="w-100 p-5" src="img/forgott.png" />
		    </div>
			<div class="w-50 px-3 border-start m-auto ">
				<div class="w-100">
					<p class="text-center text-warning fw-bold fs-4"> <span class="text-theme2">Change</span> Password</p>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../teacherChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${tchObj.id }" name="uid">
							<button class="btn btn-warning w-100">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			


		</div>
	</div>


</body>
</html>