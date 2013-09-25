<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Post picture</h2>
	<form action = "/board" method = "post">
		Title : <input type = "text" name = "title" size = "50">
		<input type = "button" value = "upload"><br>
		<textarea name = "contents" cols = "50" rows = "3" resize = none></textarea><br>
		<input type = "submit" name = "submit" value = "submit">
	</form>
</body>
</html>