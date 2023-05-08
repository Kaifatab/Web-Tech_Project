<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.theme-color-bg {
	background-color: 14213D;
}

.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.text-theme {
	color: #14213D !important;
}

.text-theme2 {
	color: #0e0069 !important;
}

.font {
	font-family: 'Poppins', sans-serif;
}
</style>
<link href="/globalStyl.css" rel="stylesheet" type="text/css">
</head>




<body class="font">


	<%@include file="component/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/banner4	.jpg" class="d-block w-100" alt="..."
					height="600px">

			</div>
			<div class="carousel-item">
				<img src="img/pexels-suzy-hazelwood-1122865.jpg"
					class="d-block w-100" alt="..." height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/pexels-josh-sorenson-990432.jpg" class="d-block w-100"
					alt="..." height="600px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>



	<div class="container d-flex mt-3 my-5 py-5">
		<div class="m-auto">
			<h2 class="text-theme2 fw-bold">CourseCord</h2>
			<p class="text-dark">Education is a commitment to excellence in
				Teaching and Learning.</p>
		</div>
		<div class="m-auto w-50">
			<img class="w-100" alt="this is a picture" src="img/home3.jpg">
		</div>
	</div>

	<div class="container p-3">
		<p class="text-center fs-2 text-theme2 border-bottom pb-4 fw-bold">Key
			Features of our Website</p>

		<div class="row">
			<div class="col-md-12 py-5">
				<div class="row">
					<div class="col-md-3">
						<div class="p-4 shadow-lg">
							<div class="text-center ">
								<p class="fs-5 fw-bold text-primary mb-3">Take up new
									courses</p>
								<p>Enrich your knowledge and expertise by exploring our
									courses designed to help you achieve
									your learning goals.</p>

							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="p-4 shadow-lg">
							<div class="text-center ">
								<p class="fs-5 fw-bold text-primary mb-3">Learn from the
									experts</p>
								<p>Acquire top-notch skills and knowledge by learning
									directly from seasoned professionals and industry leaders.</p>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="p-4 shadow-lg">
							<div class="text-center ">
								<p class="fs-5 fw-bold text-primary mb-3">Explore new things</p>
								<p>Expand your horizons and discover new interests with our
									diverse range of learning opportunities.</p>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="p-4 shadow-lg">
							<div class="text-center ">
								<p class="fs-5 fw-bold text-primary mb-3">Work on your
									skills</p>
								<p>Boost your career prospects by honing your skills with
									our comprehensive learning resources.</p>
							</div>
						</div>
					</div>
				</div>
			</div>



		</div>
	</div>

	<hr>

	<%@include file="component/footer.jsp"%>

</body>
</html>