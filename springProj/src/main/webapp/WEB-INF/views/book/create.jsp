<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>책 등록</h1>
<!-- BookController.java에서 mav.addObject("title", "도서생성"); -->
<h5>${title}</h5>
<!-- 
요청URI : /crate
요청파라미터 : {title=개똥이의 모험, category=소설, price=12000}
요청방식 : post
-->
<!-- /create URL 같지만 방식이 다르다 그래서 다른 요청이다 -->
<form action="/create" method="post">
	<!-- 폼데이터 -->
	제목 : <input type="text" name="title" placeholder="제목"> <br>
	카테고리 : <input type="text" name="category"placeholder="카테고리"><br>
	가격 : <input type="number" name="price" placeholder="가격"><br>
	<input type="submit" value="저장">
</form>
</body>
</html>