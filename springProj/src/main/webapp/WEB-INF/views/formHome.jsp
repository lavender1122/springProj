<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
method 생략 시 get방식이 기본임
method="get"이 생략됨
 -->
<form action="/board/register">
	<input type = "submit" value="register(GET)"/>
</form>
<hr/>
<!-- 
요청 URL : /board/register
요청파라미터 : 
요청방식 : post
 -->
<form action="/board/register" method="post">
	<input type = "submit" value="register(POST)"/>
</form>
<hr />
<!-- 
요청URI : /board/modify
요청파라미터 : 
요청방식 : get
-->
<form action="modify">
   <input type="submit" value="modify(GET)" />
</form>
<hr />
<!-- 
요청URI : /board/modify
요청파라미터 : 
요청방식 : post
-->
<form action="/board/modify" method="post">
   <input type="submit" value="modify(POST)" />
</form>