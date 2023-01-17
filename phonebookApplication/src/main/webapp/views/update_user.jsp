<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@include file="navbar.jsp" %>
	<c:if test="${user == null}">
		<% request.setAttribute("NOTIFICATION", "Please login.....");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/login_form.jsp");
		//response.sendRedirect(request.getContextPath()+"/views/login_form.jsp");
		dispatcher.forward(request, response);
		%>
	</c:if>
	<div
		style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); background: #ff8a6f; width: 446px; border-radius: 58px; padding-block: 24px; padding-inline: 82px;">
		<h3 style="font-family: ui-serif;">
			Edit User <i class="fa-solid fa-users"></i>
		</h3>
		<h6 style="color: red">${NOTIFICATION}</h6>
		<form action="${pageContext.request.contextPath}/ContactServlet"
			method="POST">
			<input type="hidden" name="id" value="${user.uid}">
			<div class="form-group">
				Name   :-<input type="text" name="username" value="${user.name}"
					placeholder="Username" style="background: gainsboro; margin-left: 26px;" autofocus="autofocus">
			</div>

			<div class="form-group">
				Email  :-<input type="email" name="useremail" value="${user.email}"
					placeholder="Email" style="background: gainsboro;    margin-left: 31px;">
			</div>
			<div class="form-group">
				Address:-<input type="text" name="useraddress" value="${user.address}"
					placeholder="Address" style="background: gainsboro;    margin-left: 15px;">
			</div>
			<input type="hidden" name="password" value="${user.password}"> 
			<input type="hidden" name="image" value="${user.image}"> 
			<input type="hidden" name="action" value="USERADD">
			<button type="submit" class="btn btn-primary">
				Update <i class="fa-solid fa-pen-to-square"></i>
			</button>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>