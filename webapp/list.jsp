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
	
<script>
	function initPage(){
		countComments();
		registerEvents();
		console.log("loaded");
	}
	
	function countComments(){
		var showComment = document.querySelectorAll('.commentList');
		for(var i = 0; i < showComment.length; i++ ){
			var currentPage = showComment[i];
			var commentsCount= currentPage.querySelectorAll('p').length;
			var parent = currentPage.parentNode;
            parent.querySelector('.commentCount > span').innerText = commentsCount;
		} 
	}
	
	function registerEvents(){
		var list = document.getElementsByClassName('commentShow');
		for(var i = 0; i < list.length; i++){
			list[i].addEventListener('click', toggleComments, false);
		}
	}
	
	function toggleComments(e) {
		e.preventDefault();
		var commentList = e.target.nextElementSibling;
		commentList.style.display = (commentList.style.display != 'block'? 'block': 'none');
	}

	window.onload=initPage;
</script>
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

					<div class=get_comment>
						<form action="/board/${board.id}/comments" method="post">
							<textarea name="contents" rows="2" cols="20"></textarea>
							<input type="submit" value="comments"> <br>
						</form>
					</div>
					<div class = "commentCount">
						Number of Comments: <span></span>
					</div>

					<a href="#" class="commentShow">Show me the comments</a>
					<div class="commentList">
						<c:forEach var="comment" items="${board.comments }">
							<p> - ${comment.contents}</p>
						</c:forEach>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
</body>
</html>