<%@page import="java.io.PrintWriter"%>
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
	<div>
		<h3><p style="color: #40ff4e;">${NOTIFICATION}</p></h3>
	</div>
	
	<div
		style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); background: aquamarine; width: 528px; border-radius: 58px; padding-block: 24px; padding-inline: 82px;">
		<form action="${pageContext.request.contextPath}/ContactServlet"
			method="POST">
			<h1 style="font-family: cursive;">
				<c:if test="${contact != null}">
				 
                                    Edit Contact
                                </c:if>
				<c:if test="${contact == null}">
				 
                                    Add New Contact
                                </c:if>
			</h1>
			<div class="form-group">
				Name:-<input type="text" class="form-control" name="name"
					placeholder="Enter Name" value="${contact.name}"
					autofocus="autofocus" />
			</div>

			<div class="form-group">
				Email:-<input type="email" class="form-control" name="email"
					placeholder="Enter Email" value="${contact.email}" />
			</div>

			<div class="form-group">
				Phone:-<input type="text" class="form-control" name="phone"
					placeholder="Enter Mobile Number" value="${contact.phone}" />
			</div>
				<input type="hidden" name = "id" value="${contact.id}">
				<input type="hidden" name="action" value="ADD" />

			<button type="submit" class="btn btn-primary">Save <i class="fa-solid fa-floppy-disk"></i></button>
			<button type="submit" class="btn btn-success">
				<a href="${pageContext.request.contextPath}/ContactServlet"
					style="color: white;"> View Contact List <i class="fa-solid fa-eye"></i></a>
			</button>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>