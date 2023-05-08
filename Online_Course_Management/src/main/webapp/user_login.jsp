<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login Page</title>

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

	<!-- user login start -->
	<div class="container p-5">
		<div class="w-75 shadow-lg d-flex mt-5 mx-auto">
		    <div  class="w-50">
		     <img class="w-100 p-3" src="img/sign.jpg" />
		    </div>
			<div class="w-50 border-start d-flex">
				<div class="m-auto w-100">
					<div class="px-5">
						<p class="text-center text-warning fw-bold fs-4 pb-3"> <span class="text-theme2">Login as</span> Student</p>
						
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>


						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control w-100">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-warning w-100">Login</button>
						</form>

						 <div class="pt-3 text-center"> Don't have an account? <a href="signup.jsp"
							class="text-decoration-none"> create one</a> </div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- user login end -->

</body>
</html>