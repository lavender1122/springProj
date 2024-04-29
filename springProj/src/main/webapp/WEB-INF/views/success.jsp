<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>success.jsp</h3>
<hr />
<!-- 
요청URI : /board/post?modify
params : modify
요청방식 : post
-->
<form action="/board/post" method="post">
   <button type="submit" name="modify">Modify</button>
</form>
<hr />
<!-- 
요청URI : /board/post?list
params : modify
요청방식 : post
-->
<form action="/board/post" method="post">
   <button type="submit" name="list">List</button>
</form>
<hr />
<!-- 
요청URI : /board/post?remove
params : modify
요청방식 : post
-->
<form action="/board/post" method="post">
   <button type="submit" name="remove">Delete</button>
</form>