<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My page</title>

<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/showlist.css" />
<script>
	function init(){
		ppureo();
		console.log("onload");
	}
	function ppureo(){
		var title=document.querySelectorAll('.title');
		var thumbnail=document.querySelectorAll('.thumbnail');
		var i = 0;
		<c:forEach var="board" items="${list}">
			if(i < 6) {
				title[i].innerHTML="<a href =\"/board/${board.id}\">${board.title}</a>";
				<c:if test="${board.fileName != null}">
					thumbnail[i].innerHTML="<a href =\"/board/${board.id}\"> <img src=\"/images/${board.fileName}\" height=100></a>"
				</c:if>
				i++;
			}
		</c:forEach>
		
		
	}
	window.onload=init;
</script>
</head>

<body>
	<div id="wrap">
		<!-- 상단 바  -->
		<div class="top">
			<div class="top_inside">
				<h2>My page</h2>
				<h2>
					<a href="/user/login">LogIn</a>
				</h2>
			</div>
		</div>
		
		<div class="list">
			<div class = page>
				
				 <div class="line1">
				 	<div class="lineLeft">
						<div class ="post">
							<div class="thumbnail"></div>
							<div class="title"> </div>
						</div>
					</div>
					<div class="lineRight">
						<div class ="post">
							<div class="thumbnail"></div>
							<div class="title"> </div>
						</div>
					</div>
				</div>
				 <div class="line2">
					<div class="lineRight">
						<div class ="post">
							<div class="thumbnail"></div>
							<div class="title"> </div>
						</div>
					</div>
				 	<div class="lineLeft">
						<div class ="post">
							<div class="thumbnail"></div>
							<div class="title"> </div>
						</div>
					</div>

				</div>
				 <div class="line3">
				 	<div class="lineLeft">
						<div class ="post">
							<div class="thumbnail"></div>
							<div class="title"> </div>
						</div>
					</div>
					<div class="lineRight">
						<div class ="post">
							<div class="thumbnail"></div>
							<div class="title"> </div>
						</div>
					</div>
				</div>
				<a href ="/board/{board.id}">가</a>
			</div>
			
			<%-- <!-- 쓰는 페이지 부분  -->
			<div class="writing">
				<div class="formArea">
					<form action="/board/write" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="id" value="${id}">
						 <input type="hidden" name="modify" value="${modify}">
						<input type="text" name="title" size=50 value="${board.title}"
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
			</div> --%>
			<!-- 글 보여주는 부분 요거 디브 어디갔징  -->
<%-- 			<c:forEach var="board" items="${list}">
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

			</c:forEach> --%>
		</div>
	</div>
</body>
</html>