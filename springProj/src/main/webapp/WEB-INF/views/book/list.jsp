<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>도서 목록</title>
<script type="text/javascript">
$(function(){
	$("#btnSearch").on("click",function(){
		let keyword =$("input[name='keyword']").val();
		
		//json오브젝트
		let data={
				"keyword":keyword
		};
		console.log("data:",data)
		//this => 내가 바로 클릭한것
// 		$(this).parent().submit();
		getList(keyword);
	});
	
	$("#btnSearchAll").on("click",function(){
		getList("");
	});
	
	//목록 함수 호출
	getList("");
});
//목록
function getList(keyword){
	//json오브젝트
	let data= {
			"keyword":keyword
	}
	
	//data:{"keyword":""}
	//아작나써유.. (피)씨다터써..
	$.ajax({
		url:"/listAjax",
		contentType:"application/json;charset=utf-8",
		//요청영역
		data:JSON.stringify(data),
		type:"post",
		//응답영역
		dataType:"json",
		success:function(result){
			//result:List<BookVO>		
			console.log("result",result);
			
			let str="";
			
			$.each(result,function(idx,bookVO){
			str +="<tr>";
			str +="<td>"+(idx+1)+"</td>";
			str +="<td><a href='/detail?bookId="+bookVO.bookId+"'>"+bookVO.title+"</a></td>";
			str +="<td>"+bookVO.category+"</td>";
			str +="<td>"+bookVO.price+"원</td>";
			str +="</tr>";
			});
			$("#trShow").html(str);
		}
	})
}

</script>
</head>
<body>
<h3>도서 목록</h3>
<p>
	<!-- 
   	  action속성 및 값이 생략 시, 현재 URI(/list)를 재요청. 
      method는 GET(form 태그의 기본 HTTP 메소드는 GET임) 
      param : keyword=알탄
           요청URI : /list?keyword=알탄 or /list or /list?keyword=
           요청파라미터 : keyword=알탄
           요청방식 : get
   -->
	<form>
		<input type="text" name="keyword" value="" placeholder="검색어 입력하세요">
		<!-- submit /button/ reset -->
		<button type="button" id="btnSearch">검색</button>
		<button type="button" id="btnSearchAll">전체보기</button>
	</form>
	<a href="/create">도서등록</a>
</p>
<%-- <p>${bookVOList} </p> --%>
<table border=1>
	<thead>
		<tr>
			<th>번호</th><th>제목</th><th>카테고리</th><th>가격</th>
		</tr>
	</thead>
	<tbody id="trShow">
	<!-- 
      forEach 태그? 배열(String[], int[][]), Collection(List, Set) 또는 
      Map(HashTable, HashMap, SortedMap)에 저장되어 있는 값들을 
      순차적으로 처리할 때 사용함. 자바의 for, do~while을 대신해서 사용함
      var : 변수
      items : 아이템(배열, Collection, Map)
      varStatus : 루프 정보를 담은 객체 활용
         - index : 루프 실행 시 현재 인덱스(0부터 시작)
         - count : 실행 회수(1부터 시작. 보통 행번호 출력)
       -->
       <!-- data : mav.addObject("bookVOList", bookVOList); -->
       <!-- bookVOList => List<BookVO> -->
       <!-- row : bookVO 1행 -->
       <!--  -->
<%--        <c:forEach var="bookVO" items="${bookVOList}"  varStatus="stat"> --%>
<!-- 		<tr> -->
<%-- 			<td>${stat.count}</td> --%>
<%-- 			<td><a href="/detail?bookId=${bookVO.bookId}"> ${bookVO.title}</a></td> --%>
<%-- 			<td>${bookVO.category}</td> --%>
<%-- 			<td><fmt:formatNumber value="${bookVO.price}" pattern="#,###"/> --%>
<!-- 		</tr> -->
<%--        </c:forEach> --%>
	</tbody>
</table>
</body>
</html>