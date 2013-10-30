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
				<h2>Service name</h2>
				<h2>
					<a href="/user/login">LogIn</a>
				</h2>
			</div>
		</div>
		<div class="list">
			<div class="spring"></div>
			<div class="writing">
				<div class="formArea">
					<form action="/board/write" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="id" value="${id}"> <input
							type="hidden" name="modify" value="${modify}"> <input
							type="text" name="title" size=50 value="${board.title}"
							placeholder="Title"><br />

						<textarea name="contents" rows="20" cols="50"
							placeholder="Content">${board.contents}</textarea>
						<br />
						<c:if test="${board.fileName != null}"></c:if>

						<div class="bottom">
							<input type="file" name="file"><br> <input
								type="submit" value="SEND"> <input type="reset"
								value="RESET">
						</div>
					</form>
				</div>
			</div>
			<c:forEach var="board" items="${list}">
				<div class="spring"></div>
				<div class="page">
					<div class="title">
						<h1>${board.title}</h1>
					</div>
					<div class=picture>
						<c:if test="${board.fileName != null}">
							<img src="/images/${board.fileName}" width=400>
							<br>
						</c:if>
					</div>

					<div class="content">${board.contents}</div>

					<div class="below_content">
						<a href="./${board.id}/modify"><button class="modify">수정</button></a> 
						<a href="./${board.id}/delete"><button class="delete">삭제</button></a>
					</div>

					<div class=getComment>
						<form action="/board/${board.id}/comments" method="post">
							<textarea name="contents" rows="2" cols="20"></textarea>
							<input type="submit" value="comments"> <br>
						</form>
					</div>

					<div class=showComment>
						<c:forEach var="comment" items="${board.comments }">
							<li>${comment.contents }</li>
						</c:forEach>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
</body>
</html>