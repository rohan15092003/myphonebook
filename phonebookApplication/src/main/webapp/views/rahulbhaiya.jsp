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
<!-- <script type="text/javascript" src="js/index.js"></script> -->
<script src="https://www.w3schools.com/lib/w3.js"></script>
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
	<div class="container">
		<h3>
			<p style="color: #40ff4e;">${NOTIFICATION}</p>
		</h3>
		<br>
		<form
			action="${pageContext.request.contextPath}/ContactServlet?action=DELETE"
			method="post">
			<p>
				<button class="btn btn-danger"
					onclick="return confirm('Are you sure you want to delete this item?');"
					style="color: white;">
					DELETE <i class="fa-sharp fa-solid fa-trash"></i></a>
				</button>
			<p style="text-align: right;">
				<input type="search" id="myInput" onkeyup="myFunction()"
					placeholder="Search for names.." title="Type in a name" value="">
			</p>
			</p>

			<table class="table table-striped table-bordered" id="myTable">

				<tr class="thead-dark">
					<th><i class="fa-sharp fa-solid fa-badge-check"></i>check</th>
					<th><i class="fa-solid fa-users"></i> Id &nbsp;
						<div class="btn-group" role="group"
							aria-label="Button group with nested dropdown">
							<button type="button" class="btn btn-success"
								onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(2)')">
								<i class="fa-solid fa-arrow-up"></i>
							</button></th>
					<th><i class="fa-solid fa-users"></i> Name &nbsp;
						<div class="btn-group" role="group"
							aria-label="Button group with nested dropdown">
							<button type="button" class="btn btn-success"
								onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(3)')">
								<i class="fa-solid fa-arrow-up"></i>
							</button></th>
					<th><i class="fa-solid fa-envelope"></i> email</th>
					<th><i class="fa-regular fa-address-book"></i> phone</th>
					<th>Actions</th>
				</tr>

				<c:forEach items="${list}" var="contact">

					<tr class="item">
						<td><input type="checkbox" name="check" id="check"
							value="${contact.id}"></td>
						<td>${contact.id}</td>
						<td>${contact.name}</td>
						<td>${contact.email}</td>
						<td>${contact.phone}</td>
						<td>
							<button type="button" class="btn btn-success">
								<a
									href="${pageContext.request.contextPath}/ContactServlet?action=EDIT&id=${contact.id}"
									style="color: white;">Edit <i
									class="fa-solid fa-pen-to-square"></i></a>
							</button>
						</td>
					</tr>
				</c:forEach>
			</table>

		</form>

	</div>
	<%@include file="footer.jsp"%>
	<script type="text/javascript">
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[2];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		};
		w3.sortHTML = function(id, sel, sortvalue) {
			var a, b, i, ii, y, bytt, v1, v2, cc, j;
			a = w3.getElements(id);
			for (i = 0; i < a.length; i++) {
				for (j = 0; j < 2; j++) {
					cc = 0;
					y = 1;
					while (y == 1) {
						y = 0;
						b = a[i].querySelectorAll(sel);
						for (ii = 0; ii < (b.length - 1); ii++) {
							bytt = 0;
							if (sortvalue) {
								v1 = b[ii].querySelector(sortvalue).innerText;
								v2 = b[ii + 1].querySelector(sortvalue).innerText;
							} else {
								v1 = b[ii].innerText;
								v2 = b[ii + 1].innerText;
							}
							v1 = v1.toLowerCase();
							v2 = v2.toLowerCase();
							if ((j == 0 && (v1 > v2)) || (j == 1 && (v1 < v2))) {
								bytt = 1;
								break;
							}
						}
						if (bytt == 1) {
							b[ii].parentNode.insertBefore(b[ii + 1], b[ii]);
							y = 1;
							cc++;
						}
					}
					if (cc > 0) {
						break;
					}
				}
			}
		};
	</script>
</body>
</html>
