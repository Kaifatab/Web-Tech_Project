
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- navbar component start -->
<nav style="background-color: #14213D !important;" class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid mx-5">
		<a class="navbar-brand text-warning" href="index.jsp"><i
			class="fa-solid fa-book"></i> CourseCORD</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item text-warning"><a class="nav-link text-warning" href="index.jsp">Home</a></li>
				<li class="nav-item text-warning"><a class="nav-link text-warning" href="student.jsp">Student</a></li>
			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-warning dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fas fa-user-circle"></i> ${tchObj.fullName }
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="edit_profile.jsp">Change Password
								</a></li>
						<li><a class="dropdown-item" href="edit_teacher_profile.jsp">Edit Profile</a></li>
						<li><a class="dropdown-item" href="../teacherLogout">Logout</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>
<!-- navbar component end -->