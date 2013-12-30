
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My page</title>

<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/showlist.css" />
<script>
	var board = [];//dic
	function initBoard() {
		var i = 0;
		<c:forEach var="board" items="${list}">
			board[i] = {};
			board[i].id= "${board.id}";
			board[i].title = "${board.title}";
			board[i].fileName = "${board.fileName}";
			++i;
		</c:forEach>
	}
	
	function init(){
		var pageNum = Math.ceil(${fn:length(list)} / 6);//3.11
		
		initBoard();
		pageList(pageNum);
		
		var page = document.querySelectorAll(".page");
		
		for(var i = 0; i < page.length; i++) {
			page[i].style.left = i * 100 + "%";
			ppureo(page[i], i);
		}
		
		document.addEventListener('click',move,false);
		console.log("onload");
	}

	function ppureo(page, pageNum){
		var title = page.querySelectorAll('.title');
		var thumbnail = page.querySelectorAll('.thumbnail');
		var start = pageNum * 6 + 0;
		for(var i = 0; i < 6; ++i) {
			var boardNum = start + i;
			if(boardNum >= board.length)
				break;
			
			title[i].innerHTML="<a href =\"/board/" + board[boardNum].id + "\">" + board[boardNum].title + "</a>";
			if(!board[boardNum].fileName)
				continue;
			
			thumbnail[i].innerHTML="<a href =\"/board/" + board[boardNum].id + "\"> <img src=\"/images/" + board[boardNum].fileName + "\" height=100></a>";
		}
	}
	function move(index){
		//var page = document.getElementById("right_move");
		var eleList = document.getElementById("list");
		var page = document.querySelectorAll(".page");

		for(var i = 0; i < page.length; i++) {
			page[i].style.left =  (i - index + 1) * 100  + "%";
			ppureo(page[i], i);
		}
		list.style.left = 0 + "px";
		//list.style.left = (parseInt(list.style.left)+900)+"px";
	}
	
	function pageList(pageNum){
		var page = document.querySelector(".pageNum");
		
/* 		if (i > 6){
			if(i%6==0){}
			var pageNum=i/6;

			for(var j = 1; j < pageNum; j++){
				console.log("test"+page);
					var string ="<a href = \"주소\">[" + (j+1) + "]</a>";
				page.insertAdjacentHTML("beforeend",string);
			}
		} */
		var list = document.getElementById("list");
		var pageHTML = list.innerHTML;
		for(var j = 1; j <= pageNum; j++) {
			if(j != 1) list.insertAdjacentHTML("afterbegin", pageHTML);
			//console.log("test"+page);
			var string ="<a href = \"#\" onclick=\"move("+j+")\">[" + (j) + "]</a>";
			page.insertAdjacentHTML("beforeend",string);
		}
	}
	window.onload=init;
</script>
</head>

<body>
	<div id="wrap">
		<!-- 상단 바  -->
		<div class="top">
			<div class="top_inside">
				<h2>
					<a href="/board/list">My page</a>
				</h2>
				<h2>
					<c:choose>
						<c:when test="${not empty sessionScope.userId}">
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

		<div class=canvas>
			<!--   한 페이지 시작  -->
			<div id="list">
				<div class="page">

					<div class="line1">
						<div class="lineLeft">
							<div class="post">
								<div class="thumbnail"></div>
								<div class="title"></div>
							</div>
						</div>


						<div class="lineRight">
							<div class="post">
								<div class="thumbnail"></div>
								<div class="title"></div>
							</div>
						</div>
					</div>
					<div class="line2">
						<div class="lineRight">
							<div class="post">
								<div class="thumbnail"></div>
								<div class="title"></div>
							</div>
						</div>
						<div class="lineLeft">
							<div class="post">
								<div class="thumbnail"></div>
								<div class="title"></div>
							</div>


						</div>

					</div>
					<div class="line3">
						<div class="lineLeft">
							<div class="post">
								<div class="thumbnail"></div>
								<div class="title"></div>
							</div>
						</div>
						<div class="lineRight">
							<div class="writing">
								<a href="/board/writing"> WRITE </a>
							</div>
							<div class="post">
								<div class="thumbnail"></div>
								<div class="title"></div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="pageNum"></div>
	</div>

</body>
</html>