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
	<h1>LIST</h1>
	<a href="/board/form"><input type = button value = "WRITING"> </a>
	<c:forEach var="document" items="${list}">
		<li><a href="/board/${document.id}"></a>
			<p>
				<a href="/board/${document.id}">${document.title}</a><br>
				<a href="/board/${document.id}">${document.contents}</a>
			</p></li>
	</c:forEach>


</body>
</html>