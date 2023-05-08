<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CourseCORD</title>

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

	<!-- redirecting login page -->
	<c:if test="${ empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<!-- change password component start -->
	<div class="container p-4 d-flex mx-auto">
		<div class="w-75 shadow-lg d-flex mt-5 mx-auto">
		    <div  class="w-50">
		     <img class="w-100 p-5" src="img/forgott.png" />
		    </div>
			<div class="w-50 px-3 border-start ">
				<div class=" p-3">
					<p class="text-center text-warning fw-bold fs-4 pt-5"> <span class="text-theme2">Change</span> Password</p>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="userChangePassword" method="post">
							<div class="mb-3">
								<label class="pb-1">Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label class="pb-1">Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${userObj.id }" name="uid">
							<button class="btn btn-warning text-light w-100">Change Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- change password component end -->

</body>
</html>