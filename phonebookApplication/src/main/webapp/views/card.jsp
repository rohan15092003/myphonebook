<%@page import="com.dollop.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0px;
padding: 0px;
background: #f1f1f1;
font-family: arial;
box-sizing: border-box;
}
.card-container{
width: 300px;
height: 430px;
background: #FFF;
border-radius: 6px;
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%,-50%);
box-shadow: 0px 1px 10px 1px #000;
overflow: hidden;
display: inline-block;
}
.upper-container{
height: 150px;
background: #7F00FF;
}
.image-container{
background: white;
width: 80px;
height: 80px;
border-radius: 50%;
padding: 5px;
transform: translate(100px,100px);
}
.image-container img{
width: 72px;
height: 72px;
border-radius: 50%;
}
.lower-container{
height: 280px;
background: #FFF;
padding: 20px;
padding-top: 40px;
text-align: center;
}
.lower-container h3, h4{
box-sizing: border-box;
line-height: .6;
font-weight: lighter;
}
.lower-container h4{
color: #7F00FF;
opacity: .6;
font-weight: bold;
}
.lower-container p{
font-size: 16px;
color: gray;
margin-bottom: 30px;
}
.lower-container .btn{
padding: 12px 20px;
background: #7F00FF;
border: none;
color: white;
border-radius: 30px;
font-size: 12px;
text-decoration: none;
font-weight: bold;
transition: all .3s ease-in;
}
.lower-container .btn:hover{
background: transparent;
color: #7F00FF;
border: 2px solid #7F00FF;
}
</style>
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
<br>
 <div class="card-container" style="margin-top: 37px;">
         <div class="upper-container">
            <div class="image-container">
               <img src="${pageContext.request.contextPath}/images/${user.image}" alt="No Image Available" />
            </div>
         </div>
         <div class="lower-container">
            <div>
               <h3><b>${user.name}</b></h3>
               <h4>Java Developer</h4>
            </div>
            <div>
               Email:- <h6>${user.email}</h6>
               Address:- <h6>${user.address}</h6>
            </div>
            <div>
               <a href="${pageContext.request.contextPath}/views/upload.jsp" class="btn">Update profile</a>
            </div>
         </div>
      </div>
      
</body>
</html>