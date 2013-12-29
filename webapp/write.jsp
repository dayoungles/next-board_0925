<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css" />
</head>
<body>
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
			
	<div id ="wrap">
		<div id = "title">
			<h1>New Post</h1> 
		</div>
	
	<div id="formArea">	
		<form action="/board/write" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${id}"> 
			<input type="hidden" name="modify" value="${modify}">
			<input type="text" name="title" size=50 value="${board.title}" placeholder="Title"><br />

			<textarea name="contents" rows="20" cols="50" placeholder= "Contents">${board.contents}</textarea>
			<br />
			<c:if test="${board.fileName != null}"></c:if>
			
			<div id="bottom">
				<input type="file" name="file"><br>
				 <input type="submit" value="SEND">
				  <input type="reset" value="RESET">
			  </div>
		</form>
	</div>
	
	</div>
</body>
</html>
