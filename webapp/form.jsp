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
	<h2>Post picture</h2>
		<form action="/board/write" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${id}">
			<input type="hidden" name="modify" value="${modify}">
			제목 : <input type="text" name="title" size=40 value="${board.title}"><br />
			
			<textarea name="contents" rows="10" cols="50">${board.contents}</textarea>
				
			<br />
			<c:if test="${board.fileName != null}"></c:if>
			 <input type="file" name="file" /><br> <input
				type="submit" value="보내기">
		</form>
</body>
</html>
