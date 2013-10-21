<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/board"><input type=button value="LIST"></a>
	<a href="./${id}/modify"><button class="modify">수정</button></a>
	<a href="./${id}/delete"><button class="delete">삭제</button></a>
	<h1>${board.title}</h1>
	<br>
	<c:if test="${board.fileName != null}">
		<img src="/images/${board.fileName}" width=400>
		<br>
		<br>

	</c:if>
	<div id="contents" style='border: 3px solid black; width: 400px'>
		${board.contents}
	</div>
	<form action ="/board/${id}/comments" method = "post">
		<textarea name="contents" rows="2" cols="50"></textarea>
		<input type="submit" value="comments"> <br>
	</form>
	<c:forEach var = "comment" items = "${board.comments }">
		<li> ${comment.contents }</li>
	</c:forEach>
</body>
</html>