<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Result05</h3>
<p>${member}</p>
<!-- 
	MEMBer: ADDRESS = 1:1 (association)
	member.address.postCode
 -->
 <!-- model.addAttribute("member",) -->
<p>member.address.postCode
	: ${member.address.postCode}
</p>
<p>member.address.location
	: ${member.address.location}
</p>
<hr/>
<!-- List<Card> cardList -->
<h4>member.cardList</h4>
<c:forEach var="card" items="${member.cardList}" varStatus="stat">
	<p>${card.no} : ${card.validMonth}</p>
</c:forEach>