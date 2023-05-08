<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Login Page</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<%@include file="component/allcss.jsp"%>

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

	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="w-75 shadow-lg d-flex mt-5 mx-auto">
		    <div  class="w-50">
		     <img class="w-100 p-3" src="img/sign.jpg" />
		    </div>
			<div class="w-50 border-start d-flex">
				<div class="w-100 ">
					<div class="p-5">
						<p class="text-center text-warning fw-bold fs-4 pb-3"> <span class="text-theme2">Login as</span> Teacher</p>
						
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>


						<form action="teacherLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-warning col-md-12">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>