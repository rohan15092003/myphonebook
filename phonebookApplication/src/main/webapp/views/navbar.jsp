<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME PAGE</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light "
		style="background: #42a5f5; position: sticky; top: 0px">
		<i class="fa-solid fa-house"></i>
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/views/Profile.jsp">Home
			</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/views/contact_form.jsp">Add Contact</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ContactServlet?action=LIST">View
						All Contact <span class="sr-only">(current)</span>
				</a></li>
				<c:if test="${user != null}">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Profile </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/views/card.jsp">Show
							Profile</a> <a class="dropdown-item"
							href="${pageContext.request.contextPath}/views/password.jsp">Change
							Password</a>
							<a class="dropdown-item"
							href="${pageContext.request.contextPath}/ContactServlet?action=USERUPDATE&uid=${user.uid}">Edit User
							</a>
							</c:if>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">Help</a></li>
						</ul>
			<!-- <form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"
					style="margin-right: 10px;">Search</button>
			</form> -->
			<c:if test="${user != null}">
			<i class="fa-solid fa-circle-user"></i>&nbsp;<h6 style="margin-right: 10px;padding-top: 6px;">${user.name}</h6>
			</c:if>
			<c:if test="${user == null}">
				<button type="button" class="btn btn-success"
					style="margin-right: 10px;">
					<a href="${pageContext.request.contextPath}/views/login_form.jsp"
						style="color: white; text-decoration: none;">Login </a><i class="fa-solid fa-right-to-bracket"></i>
				</button>
				<button type="button" class="btn btn-warning"
					style="margin-right: 10px;">
					<a href="${pageContext.request.contextPath}/views/signup_form.jsp"
						style="color: white; text-decoration: none;">SignUp </a><i class="fa-solid fa-user-plus"></i>
				</button>
			</c:if>
			<c:if test="${user != null}">
				<button type="button" class="btn btn-danger"
					style="margin-right: 10px;">
					<a
						href="${pageContext.request.contextPath}/ContactServlet?action=LOGOUT"
						style="color: white; text-decoration: none;">Logout </a><i class="fa-solid fa-right-to-bracket"></i>
				</button>
			</c:if>


		</div>
	</nav>
</body>
</html>