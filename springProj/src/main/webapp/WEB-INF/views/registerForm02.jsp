<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h2>Spring Form</h2>
<!-- modelAttribute 속성에 폼 객체의 속성명을 지정함 -->
<form:form modelAttribute="user" method="post"
	action="/registerForm01Post">
	<p> 유저ID: 
		<input type="text" name="userId"
			placeholder="아이디"/>
		<form:input path="userId"/>	
	</p>
	<p> 이름: 
		<input type="text" name="userName"
		placeholder="이름"/>	
		<form:input path="userName"
			placeholder="이름"/>
	</p>
	<p> 이름: 
		<input type="submit" value="등록"/>
		<button type="submit">등록</button>	
		<form:button name="register">등록</form:button>
	</p>

</form:form>