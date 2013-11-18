<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="spring"></div>
			<!-- 쓰는 페이지 부분  -->
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
			</div>
</body>
</html>