<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/newWrite.css" />
<script>
	function initPage() {
		registerEvents();
		countComments();
		console.log("loaded");
	}

	function countComments() {
		var showComment = document.querySelectorAll('.commentList');
		for (var i = 0; i < showComment.length; i++) {
			var currentPage = showComment[i];
			var commentsCount = currentPage.querySelectorAll('p').length;
			var parent = currentPage.parentNode;
			parent.querySelector('.commentCount > span').innerText = commentsCount;
		}
	}

	function registerEvents() {
		var list = document.getElementsByClassName('commentShow');
		for (var i = 0; i < list.length; i++) {
			list[i].addEventListener('click', toggleComments, false);
		}
		var submit_buttons = document
				.querySelectorAll('.get_comment [type=submit]');
		for (var i = 0; i < submit_buttons.length; i++) {
			submit_buttons[i].addEventListener("click", writeComments, false);
		}
	}

	function toggleComments(e) {
		e.preventDefault();
		var commentList = e.target.nextElementSibling;
		commentList.style.display = (commentList.style.display != 'block' ? 'block'
				: 'none');
	}

	function writeComments(e) {
		e.preventDefault();
		var elementForm = e.currentTarget.form;
		debugger;
		var oFormData = new FormData(elementForm);
		var sID = elementForm[0].value;
		var url = "/board/" + sID + "/comments.json";

		var request = new XMLHttpRequest();
		request.open("POST", url, true);
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				console.log("get response");
				/* debugger; */
				var obj = JSON.parse(request.responseText);
				var comments = elementForm.parentNode.parentNode;
				var eleCommentList = comments
						.getElementsByClassName("commentList");
				console.log(eleCommentList[0]);
				eleCommentList[0].insertAdjacentHTML("beforeend", "<p>- "
						+ obj.contents + "</p>");
				elementForm.reset();

				countComments();
			}
			;

		};

		request.send(oFormData);

	}

	window.onload = initPage;
</script>
</head>
<body>
	<div class="top">
		<div class="top_inside">
			<h2>
				<a href="/board/list">My page</a>
			</h2>
			<h2>
				<c:choose>
					<c:when test="${not empty sessionScope.userId}">
					${sessionScope.userId}님    
						<a href="/user/logout">LogOut</a>
					</c:when>
					<c:otherwise>
						<a href="/user/login">Login</a>
						<a href="/user/signup">Join</a>
					</c:otherwise>
				</c:choose>
			</h2>
		</div>
	</div>

	<div id="wrap">
		<div class="page">
			<div class="polaroid">
				<div class=picture>
					<p>
					?
					</p>
				</div>
			</div>
			
			<div class="right_page">
				<div class="formArea">
					<form action="/board/write" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${id}"> 
						<input type="hidden" name="modify" value="${modify}"> 
						<input type="text" name="title" size=31 value="${board.title}" placeholder="Title"><br />
						<textarea name="contents" rows="10" cols="32" placeholder="Contents">${board.contents}</textarea>
						<br />
						<c:if test="${board.fileName != null}"></c:if>

						<div id="bottom">
							<input type="file" name="file"><br> <input
								type="submit" value="SEND"> <input type="reset"
								value="RESET">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	</div>
</body>
</html>
