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

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Teacher Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						TeacherDao dao2 = new TeacherDao(DBConnect.getConn());
						Teacher d = dao2.getTeacherById(id);
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

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>