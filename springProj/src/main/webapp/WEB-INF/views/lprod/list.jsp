<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품분류 목록</title>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
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
   <h1>상품분류 목록</h1>
<%--    <p>${lprodVOList}</p> --%>
<p>
   <!-- action속성 및 값이 생략 시, 현재 URI(/list)를 재요청. 
    method는 GET(form 태그의 기본 HTTP 메소드는 GET임) 
    param : keyword=알탄
      요청URI : /list?keyword=알탄 or /list or /list?keyword=
      요청파라미터 : keyword=알탄
      요청방식 : get
      -->
   <form>
      <input type="text" id="keyword" name="keyword" value="" placeholder="검색어를 입력하세요">
      <button type="button" id="btnSearch">검색</button><br>
   </form>
   <a href="/lprod/create">상품 등록</a>
</p>
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