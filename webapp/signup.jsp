<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>SIGN UP</h1>
	<form action="/user/join" method="post">
		<div id=sign style="border: 3px gray solid; width: 500px "><!-- margin left설 -->
			<br> ID: <input type="text" name="id">줄 정렬..?<br>
			Password: <input type="password" name="password"><br>
			E-mail: <input type="text" name="email"><br> <input
				type="submit" value="SIGN UP"><br>
		</div>

	</form>
</body>
</html>