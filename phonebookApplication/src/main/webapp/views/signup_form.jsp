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
	
	<div
		style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); background: gold; width: 446px; border-radius: 58px; padding-block: 24px; padding-inline: 82px;">
		<h3 style="font-family: ui-serif;">
			SignUp User <i class="fa-solid fa-users"></i>
		</h3>
		<h6 style="color: red">${NOTIFICATION}</h6>
		<form action="${pageContext.request.contextPath}/ContactServlet"
			method="POST">
			<div class="form-group">
				Name   :-<input type="text" name="username" value=""
					placeholder="Username" style="background: gainsboro; margin-left: 26px;" autofocus="autofocus">
			</div>

			<div class="form-group">
				Email  :-<input type="email" name="useremail" value=""
					placeholder="Email" style="background: gainsboro;    margin-left: 31px;">
			</div>
			<div class="form-group">
				Address:-<input type="text" name="useraddress" value=""
					placeholder="Address" style="background: gainsboro;    margin-left: 15px;">
			</div>
			<div class="form-group">
				Password:-<input type="password" name="password" value=""
					placeholder="password" style="background: gainsboro;    margin-left: 5px;">
			</div>
			<input type="hidden" name="id" value=""> 
			<input type="hidden" name="action" value="USERADD">
			<button type="submit" class="btn btn-primary">
				SignUp <i class="fa-solid fa-user-plus"></i>
			</button>
			<button type="submit" class="btn btn-success"
				style="margin-left: 26px;">
				<a href="${pageContext.request.contextPath}/views/login_form.jsp"
					style="color: white;"> Login <i class="fa-solid fa-right-to-bracket"></i></a>
			</button>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>