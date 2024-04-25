<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee</title>
</head>
<body>
<h1>직원등록</h1>
<!-- BookController.java에서 mav.addObject("title", "도서생성"); -->
<h3>${title}</h3>
	<!--
	   요청URI : /employee/create
	   요청파라미터 : {empNo=A011, empName=개똥이, empAddress=세종시 새롬중앙로 11, empTelno=010-5656-2222, empSalary=5000000, filename=A011.jpg}
	   요청방식 : post
	   
	   return 타입 : ModelAndView
	   model.setViewName("redirect:/employee/create");
	 -->
<form action="/employee/create" method="post">
	<p><input type="text" name="empNo" required placeholder="직원 번호 (ex.A011)"></p>
	<p><input type="text" name="empName" required placeholder="직원 명 (ex.개똥이)"></p>
	<p><input type="text" name="empAddress" required placeholder="직원 주소(ex.세종시 새롬중앙로 11)"></p>
	<p><input type="text" name="empTelno" required placeholder="직원 연락처(ex.010-5656-2222)"></p>
	<p><input type="number" name="empSalary" required placeholder="직원 급여(ex. 5000000)"></p>
	<p><input type="text" name="filename"  placeholder="직원번호(ex.A011.jpg)"></p>
	<input type="submit" value="등록">
</form>
</body>
</html>