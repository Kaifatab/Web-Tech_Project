<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<link href="./globalStyl.css" rel="stylesheet" type="text/css">
<nav style="background-color: #14213D !important;" class="navbar navbar-expand-lg theme-color-bg fixed">
	<div class="container">
		<a class="navbar-brand text-warning" href="./index.jsp"><i class="fa-solid fa-book"></i>
			CourseCORD</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty userObj }">
					<li class="nav-item"><a class="nav-link active text-warning"
						aria-current="page" href="admin_login.jsp"><i
							class="fas fa-sign-in-alt"></i> Admin</a></li>

					<li class="nav-item"><a class="nav-link active text-warning"
						aria-current="page" href="teacher_login.jsp">Teacher</a></li>
					<li class="nav-item"><a class="nav-link active text-warning"
						aria-current="page" href="student_enrollment.jsp">Enroll</a></li>
					<li class="nav-item"><a class="nav-link active text-warning"
						aria-current="page" href="user_login.jsp">Student</a></li>

				</c:if>




				<c:if test="${not empty userObj }">
					<li class="nav-item"><a class="nav-link active text-warning"
						aria-current="page" href="student_enrollment.jsp">Enroll</a></li>

					<li class="nav-item"><a class="nav-link active text-warning"
						aria-current="page" href="view_enrollment.jsp">View Enrollment</a></li>

					<div class="dropdown">
						<button class="btn btn-warning dropdown-toggle py-1 mx-2 my-1 rounded-1" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${userObj.fullName }
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="change_password.jsp">Change
									Password</a></li>
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>

						</ul>
					</div>




				</c:if>





			</ul>
		</div>
	</div>
</nav>