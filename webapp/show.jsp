<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/show.css" />
</head>
<body>
	<div id ="top">
		<div id ="top-middle">
			<div id = "top-m-l">
				<p class= top>SHOW</p>
			</div>
			<div id = "top-m-r">
				<a href></a><p class = top>LOG OUT</p>
				<p class = top>LIST</p>
				<p class = top>WRITE</p>
			
			</div>
		</div>
	</div>
	
	
	<div id = "wrap">
	
		<div id = "title">
			<h1>${board.title}</h1>
		</div>
		
		
		<div id = picture>
			<c:if test="${board.fileName != null}">
				<img src="/images/${board.fileName}" width=400>
				<br>
			</c:if>
		</div>

		<div id="contents">
			${board.contents}
		</div>

		<div id = "below_content">
			<a href="./${id}/modify"><button class="modify">수정</button></a>
			<a href="./${id}/delete"><button class="delete">삭제</button></a>
		</div>
		
		<div id = getComment>
			<form action ="/board/${id}/comments" method = "post">
				<textarea name="contents" rows="2" cols="50"></textarea>
				<input type="submit" value="comments"> <br>
			</form>
		</div>
		
		<div id = showComment>
			<c:forEach var = "comment" items = "${board.comments }">
				<li> ${comment.contents }</li>
			</c:forEach>
		</div>
		
	</div>
</body>
</html>