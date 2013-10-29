<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>page</title>

<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/showlist.css" />
</head>

<body>
	<div id="wrap">
		<div class="top">
			<div class="top_inside">
				<h2>WRITING</h2>
				<h2>LIST</h2>
				<h2>LogIn</h2>
			</div>
		</div>
		<div class ="list">
			<div class ="writing">
				<div id="formArea">
					<form action="/board/write" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${id}"> 
						<input type="hidden" name="modify" value="${modify}">
						<input type="text" name="title" size=50 value="${board.title}" placeholder="제목을 넣어보시게"><br />
			
						<textarea name="contents" rows="20" cols="50" placeholder= "내용을 넣으시게">${board.contents}</textarea>
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
			<c:forEach var="board" items="${list}">
				<div class= "spring"></div>
				<div class="page">
					<div id="title">
						<h1>${board.title}</h1>
					</div>
					<div id=picture>
						<c:if test="${board.fileName != null}">
							<img src="/images/${board.fileName}" width=400>
							<br>
						</c:if>
					</div>
	
					<div id="contents">${board.contents}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>