<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Result</h3>

${member}
<table border="1">
	<thead>
		<tr>
			<th>카드번호</th><th>유효연월</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="card" items="${member.cardList}" varStatus="stat">
		<tr>
			<td>${card.no}</td>
			<td>${card.validMonth}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>