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
	<div class="top">
			<div class="top_inside">
				<h2>Service name</h2>
				<h2>
					<a href="/user/login">LogIn</a>
				</h2>
			</div>
		</div>
	
	
	
	<div id = "wrap">
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
			
			<div class=comments>
				<div class=get_comment>
					<form action="/board/${board.id}/comments" method="post">
						<input type="hidden" name="id" value="${board.id}">
						<textarea name="contents" rows="2" cols="20"></textarea>
						<input type="submit" value="comments"> <br>
					</form>
				</div>
				<div class="commentCount">
					Number of Comments: <span></span><!-- span적용이 안되는데 갑자기..? 내가 뭘 건드려서 여기가 영향을 받지?? -->
				</div>

				<a href="#" class="commentShow">Show me the comments</a>
				<div class="commentList">
					<c:forEach var="comment" items="${board.comments}">
						<p>- ${comment.contents}</p>
					</c:forEach>
				</div>
			</div>
		</div>
		<%-- <div id = "title">
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
			<c:forEach var = "comment" items = "${board.comments}">
				<li> ${comment.contents }</li>
			</c:forEach>
		</div> --%>
		
	</div>
</body>
</html>