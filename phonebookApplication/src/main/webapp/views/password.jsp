<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<%@include file="navbar.jsp"%>
	<c:if test="${user == null}">
		<%
		request.setAttribute("NOTIFICATION", "Please login.....");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/login_form.jsp");
		//response.sendRedirect(request.getContextPath()+"/views/login_form.jsp");
		dispatcher.forward(request, response);
		%>
	</c:if>
	<div
		style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); background: gold; width: 446px; border-radius: 58px; padding-block: 24px; padding-inline: 82px;">
		<h3 style="font-family: ui-serif;">
			Change Password <i class="fa-solid fa-key"></i>
		</h3>
		<h6 style="color: red">${NOTIFICATION}</h6>
		<form action="${pageContext.request.contextPath}/ContactServlet"
			method="POST">
			<input type="hidden" name="id" value="${user.uid}">
			<div class="form-group">
				New Password:- <input type="text" name="password1" value=""
					placeholder="Enter New Password" style="background: gainsboro;"
					autofocus="autofocus">
			</div>

			<div class="form-group">
				Confirm Password :- <input type="text" name="password2" value=""
					placeholder="Confirm Password" style="background: gainsboro;">
			</div>
			<input type="hidden" name="action" value="CNGPASS">
			<button type="submit" class="btn btn-primary">
				Submit <i class="fa-solid fa-right-to-bracket"></i>
			</button>
		</form>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>