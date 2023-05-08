<%@page import="com.entity.Teacher"%>
<%@page import="com.dao.TeacherDao"%>
<%@page import="com.entity.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Teacher Profile</title>
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
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="w-100 shadow-lg">
					<div class="p-3">
						<p class="text-center text-warning fw-bold fs-4 py-3"> <span class="text-theme2">Edit Teacher</span> Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						
						<%
					
						Teacher d = (Teacher)session.getAttribute("tchObj");
						System.out.println(d.getCourse());
						%>
						
						
						<form action="../updateTeacher" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control" value="<%=d.getFullName()%>">
							</div>



							<div class="mb-3">
								<label class="form-label">Course</label> <select name="course"
									required class="form-control">
									<option><%=d.getCourse()%></option>

									<%
									CourseDao dao = new CourseDao(DBConnect.getConn());
									List<Course> list = dao.getAllCourse();
									for (Course s : list) {
									%>
									<option><%=s.getCourseName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control" value="<%=d.getEmail()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Phone No</label> <input type="text"
									required name="phnno" class="form-control" value="<%=d.getPhnNo()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control" value="<%=d.getPassword()%>">
							</div>
							
							<input type="hidden" name="id" value="<%=d.getId()%>">
							<input type="hidden" name="page" value="fromTeacher">
							

							<button type="submit" class="btn btn-warning col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>