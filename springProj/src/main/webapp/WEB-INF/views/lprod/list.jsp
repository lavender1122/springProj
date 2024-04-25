<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품분류 목록</title>
</head>
<body>
   <h1>상품분류 목록</h1>
<%--    <p>${lprodVOList}</p> --%>
   
   <table border="1">
      <thead>
         <tr>
            <th>아이디</th><th>코드</th><th>명</th>
         </tr>
      </thead>
      <tbody>
      <!--
      items : 배열, Collection, Map
      var : 변수
      stat.index : 0부터 시작해서 1씩 증가
      stat.count : 1부터 시작해서 1씩 증가  
       -->
         <c:forEach var="lprodVo" items="${lprodVOList}" varStatus="stat">
            <tr>
               <td>${lprodVo.lprodId}</td>
               <!-- a 링크. detail?lprodGu=P101 -->
               <td><a href="/lprod/detail?lprodGu=${lprodVo.lprodGu}">${lprodVo.lprodGu}</a></td>
               <td>${lprodVo.lprodNm}</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
</body>
</html>