<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>LOGIN</h1>
	<form action=/user/login_check method="post" enctype="multipart/form-data">
		<input type=textbox name=id placeholder="ID"><br> 
		<input type=password name=password placeholder="PASSWORD"><br>
		<input type = "submit" value = "Log in">
	</form>
<br>
	<a href = "/user/signup">SIGN UP HERE!</a>
</body>
</html>