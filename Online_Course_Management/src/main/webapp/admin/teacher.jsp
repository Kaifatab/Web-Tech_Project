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
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

<%@include file="../component/allcss.jsp"%>
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
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row mx-3 mt-4">

			<div class="col-md-4 ">
				<div class="w-100 shadow-lg">
					<div class="p-3">
						<p class="text-center text-warning fw-bold fs-4 py-3"> <span class="text-theme2">Add</span> Teacher	</p>

						<form action="../addTeacher" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<input placeholder="Enter full name" type="text" required name="fullname" class="form-control">
							</div>



							<div class="mb-3">
								<label class="form-label">Course</label> <select name="course"
									required class="form-control">
									<option>--select--</option>

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
								<label class="form-label">Email</label> 
								<input placeholder="Enter your email" type="text" required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Phone No</label> <input type="text"
							placeholder="Enter phone number" required name="phnno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
								placeholder="Enter your pass"	name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn btn-warning mx-auto w-100">Submit</button>
						</form>
					</div>
				</div>
			</div>


			<div class="col-md-8">
				<div class="w-100 shadow-lg">
					<div class="p-3">
						<p class="text-center text-warning fw-bold fs-4 py-3"> <span class="text-theme2">Teacher</span> Details	</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead class="table-primary">
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Course</th>
									<th scope="col">Email</th>
									<th scope="col">Phone No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								TeacherDao dao2 = new TeacherDao(DBConnect.getConn());
								List<Teacher> list2 = dao2.getAllTeacher();
								for (Teacher d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getCourse()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getPhnNo()%></td>
									<td><a href="edit_teacher.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-info text-light px-3  me-1">Edit</a> 
										<a href="../deleteTeacher?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>