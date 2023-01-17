<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>imageUpload</title>
</head>
<body>
<%@include file="navbar.jsp" %>
<h2>Upload Image:-</h2>
	<form action="${pageContext.request.contextPath}/UploadController?uid=${user.uid}&uimage=${user.image}" method="post" enctype="multipart/form-data">
	<input type="file" name="files" multiple="multiple" accept="image/jpeg,image/jpg,image/png">
	<button>UPLOAD</button>
	</form>
	
</body>
</html>