<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/show.css" />
<script>
	function initPage() {
		registerEvents();
		countComments();
		console.log("loaded");
	}

	function countComments() {
		var showComment = document.querySelectorAll('.commentList');
		for ( var i = 0; i < showComment.length; i++) {
			var currentPage = showComment[i];
			var commentsCount = currentPage.querySelectorAll('p').length;
			var parent = currentPage.parentNode;
			parent.querySelector('.commentCount > span').innerText = commentsCount;
		}
	}

	function registerEvents() {
		var list = document.getElementsByClassName('commentShow');
		for ( var i = 0; i < list.length; i++) {
			list[i].addEventListener('click', toggleComments, false);
		}
		var submit_buttons = document.querySelectorAll('.get_comment [type=submit]');
		for ( var i = 0; i < submit_buttons.length; i++) {
			submit_buttons[i].addEventListener("click", writeComments, false);
		}
	}

	function toggleComments(e) {
		e.preventDefault();
		var commentList = e.target.nextElementSibling;
		commentList.style.display = (commentList.style.display != 'block' ? 'block': 'none');
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
	         if(request.readyState ==4 && request.status ==200) {
				console.log("get response");
				/* debugger; */
				var obj = JSON.parse(request.responseText);
				var comments = elementForm.parentNode.parentNode;
				var eleCommentList = comments.getElementsByClassName("commentList");
				console.log(eleCommentList[0]);
				eleCommentList[0].insertAdjacentHTML("beforeend","<p>- "+obj.contents +"</p>");
				elementForm.reset();
				
				countComments();
			};
			
	    };
	    
	    request.send(oFormData);
	
	}
	
	window.onload = initPage;
</script>
</head>
<body>
	<div class="top">
			<div class="top_inside">
				<h2><a href ="/board/list">My page</a></h2>
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
	
	<div id = "wrap">
		<div class="page">
			<div class="polaroid">
 				<div class=picture>
	
						<c:if test="${board.fileName != null}">
						<img src="/images/${board.fileName}">
						<br>
					</c:if>
				</div> 
			</div>
			<div class="right_page">
				<div class="title">
					<h1>${board.title}</h1>
					<h5>${sessionScope.userId}</h5>
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
							<input type="submit" value="댓글"> <br>
						</form>
					</div>
					<div class="commentCount">
						Number of Comments: <span></span>
					</div>
	
					<a href="#" class="commentShow">Show me the comments</a>
					<div class="commentList">
						<c:forEach var="comment" items="${board.comments}">
							<p>- ${comment.contents}</p>
						</c:forEach>
					</div>
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