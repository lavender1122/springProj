<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>상품분류 등록</h1>

<!--
	요청URI : /lprod/create
	요청 파라미터 :{lprodId=14, lprodGu=P501, lprodNm=분식류}
	요청방식  :post
-->
<form action="/lprod/create" method="post">
	<p> 상품분류 아이디:<input type="number" name="lprodId" placeholder="상품분류 아이디(ex.14)"> </p>
	<p> 상품분류 코드 :<input type="text" name="lprodGu" required placeholder="상품분류 코드(ex.P501)"> </p>
	<p> 상품분류 명:<input type="text" name="lprodNm" placeholder="상품분류 명(ex. 분식류)"> </p>
	<input type="submit" value="등록">
</form>

</body>
</html>