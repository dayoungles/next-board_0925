<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/login.css" />
<title>Insert title here</title>
</head>
<body>
	<div class=wrap>
			<!-- 상단 바  -->
		<div class="top">
			<div class="top_inside">
				<h2><a href ="/board/list">My page</a></h2>
				<h2>
					<c:choose>
	                	<c:when test="${not empty sessionScope.userId}">
	                		<a href="/user/logout">LogOut</a>
	                	</c:when>
	                	<c:otherwise>
	                		<a href="/user/login">Login</a>
	                		<a href="/user/signup">Join</a>
	                	</c:otherwise>
	                </c:choose>
				</h2>
			</div>
		</div>
		
		<div class=note>
			<div class=login_box>
				<h1>LOGIN</h1>
				<form action=/user/login_check method="post">
					<input type=textbox name=id placeholder="ID"><br> 
					<input type=password name=password placeholder="PASSWORD"><br><br>
					<input type = "submit" value = "Log in">
				</form>
			</div>
		</div>
	
	</div>


<br>
	<a href = "/user/signup">SIGN UP HERE!</a>
</body>
</html>