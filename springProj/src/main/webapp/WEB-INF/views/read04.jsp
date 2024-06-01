<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Result04</h3>
<h4>hobbyArray</h4>
<!-- hobbyArray :{"Music","Movie"} -->
<c:forEach var="hobby" items="${hobbyArray}" varStatus="stat">
	<p>${stat.index} : ${hobby}</p>
</c:forEach>
<hr/>
<h4>hobbyList</h4>
<!-- hobbyList :List<String> -->
<c:forEach var="hobby" items="${hobbyList}" varStatus="stat">
	<p>${stat.index} : ${hobby}</p>
</c:forEach>