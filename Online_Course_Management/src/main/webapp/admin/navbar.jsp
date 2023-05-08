<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav style="background-color: #14213D !important;" class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand text-warning ms-5" href="#"><i class="fa-solid fa-book text-warning"></i>
			CourseCORD</a>
		<button class="navbar-toggler btn-warning" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item "><a class="nav-link active text-warning" href="index.jsp">Home</a></li>
				<li class="nav-item "><a class="nav-link active text-warning" href="teacher.jsp">Teacher</a></li>
				<li class="nav-item "><a class="nav-link active text-warning" href="student.jsp">Student</a></li>


			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-warning me-5 dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Admin</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>