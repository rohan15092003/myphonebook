<%@page import="com.dollop.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
		
	<c:if test="${user != null}">
		<h5 style="color: black;">
			<p>USER NAME:- ${user.name}</p>
		</h5>
	</c:if>
	<button type="button" class="btn btn-primary">
		<a href="${pageContext.request.contextPath}/views/contact_form.jsp"
			style="color: white;"> Add New Contact</a>
	</button>
	<button type="button" class="btn btn-secondary">
		<a
			href="${pageContext.request.contextPath}/ContactServlet?action=LIST"
			style="color: white;"> View All Contacts</a>
	</button>
	<span>
		<span class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				data-toggle="dropdown" aria-expanded="false">
				profile</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="${pageContext.request.contextPath}/views/card.jsp">Show Profile</a> <a
					class="dropdown-item" href="#">Change Password</a> <a
					class="dropdown-item" href="${pageContext.request.contextPath}/ContactServlet?action=LOGOUT">Logout</a>
			</div>
		</span>
	</span>
	<button type="button" class="btn btn-danger" style="color: white;">Help</button>
	<h6 style="color: green;">${NOTIFICATION}</h6>
	<hr style="border: 5px solid black;">

</body>
</html>