<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//request객체 안에서 있는 쿠키들을 확인
Cookie[] cookies=request.getCookies();

out.print("쿠키의 갯수"+cookies.length+"<br/>");
for(int i =0;i<cookies.length;i++){
	out.print(cookies[i].getName()+":"+cookies[i].getValue()+"<br/>");
}
%>
<h3>register.jsp</h3>
<h2>로그인 한 회원만  접근 가능</h2>
<h3>/notice/register.jsp</h3>
