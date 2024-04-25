<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>직원 목록</title>
<script type="text/javascript">
$(function(){
	$("#btnSearch").on("click",function(){
		let keyword=$("#keyword").val();
		console.log("keyword:"+keyword);
		let data={
				"keyword":keyword
		};
		console.log("data:"+data);
		$(this).parent().submit();
		
	});
})
</script>
</head>
<body>
<h3>직원 목록</h3>
<p>
<%-- ${employeeVOList} --%>
</p>
<p>
	<form>
		<input type="text" name="keyword" value="" placeholder="검색어 입력하세요">
		<!-- submit /button/ reset -->
		<button type="button" id="btnSearch">검색</button>
	</form>
	<a href="./create">직원등록</a>
</p>
<table border=1>
	<thead>
		<tr>
			<th>번호</th><th>이름</th><th>주소</th><th>전화번호</th><th>급여</th>
		</tr>
	</thead>
	<tbody>
       <c:forEach var="employeeVO" items="${employeeVOList}"  varStatus="stat">
		<tr>
			<td>${employeeVO.empNo}</td>
			<td><a href="/employee/detail?empNo=${employeeVO.empNo}">${employeeVO.empName}</a></td>
			<td>${employeeVO.empAddress}</td>
			<td>${employeeVO.empTelno}</td>
			<td>${employeeVO.empSalary}</td>
		</tr>
       </c:forEach>
	</tbody>
</table>
</body>
</html>