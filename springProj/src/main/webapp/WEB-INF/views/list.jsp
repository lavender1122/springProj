<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Params 매핑
요청URI : /board/get?register
params : register
요청방식 : get
 -->
<a href="/board/get?register">Register</a>
<hr/>
<!-- Params 매핑
요청URI : /board/post?register
params : register
요청방식 : post
 -->
<form action="/board/post" method="post">
	<button type ="submit" name="register">
	Register</button>
</form>