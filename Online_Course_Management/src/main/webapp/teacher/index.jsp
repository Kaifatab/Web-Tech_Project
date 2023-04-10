<%@page import="com.entity.Teacher"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.TeacherDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Dashboard</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcss.jsp"%>
</head>


<body>
	<c:if test="${empty tchObj }">
		<c:redirect url="../teacher_login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="navbar.jsp"%>
	
	<h1>Teacher Dashboard</h1>
</body>
</html>