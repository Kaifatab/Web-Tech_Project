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
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Teacher</p>

						<form action="../addTeacher" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control">
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
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Phone No</label> <input type="text"
									required name="phnno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>


			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Teacher Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
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
										class="btn btn-sm btn-success">Edit</a> 
										<a href="../deleteTeacher?id=<%=d.getId()%>"
										class="btn btn-sm btn-secondary">Delete</a></td>
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