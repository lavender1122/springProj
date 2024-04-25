<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
//document 내의 모든 요소들이 로딩된 후에 시랳ㅇ
//1개의 jsp에 하나 만 사용하자
	let title="${bookVO.title}";
	let category = "${bookVO.category}";
	let price ="${bookVO.price}"
$(function(){
	$("#list").on("click",function(){
		location.href="list";
	});
	
	//수정버튼 클릭 -> 수정 모드 전환
	$("#edit").on("click",function(){
		$("#p1").css("display","none");
		$("#p2").css("display","block");
		//readonly 속성 제거
		$(".formdata").removeAttr("readonly");
	});
	//취소버튼 클릭
	$("#cancel").on("click",function(){
		$("#p1").css("display","block");
		$("#p2").css("display","none");
		//readonly 속성 추가
		$(".formdata").attr("readonly",true);
		//입력란 초기화
		//태그로 접근하면 태그만 
		$("input[name='title']").val(title);		
		$("input[name='category']").val(category);		
		$("input[name='price']").val(price);		
		console.log("title:"+title+",category:"+category+",price"+price);
	});
	/*
		요청URI : /deletePost
		요청파라미터 : {bookId=127, title=개똥이의 모험2, category=소설2, price=12002}
		요청방식 : post
	*/
	//삭제버튼 클릭
	$("#delete").on("click",function(){
		//속성 변경 action="/deletePost" 변경
		$("#frm").attr("action","/deletePost");
		let result = confirm("삭제하시겠습니까?");
		//확인:true / 취소 : false
		console.log("result:"+result);
		
		if(result > 0){ // true ==1
			$("#frm").submit();
		}else{
			alert("삭제가 취소되었습니다.");
		}
	});
});
</script>
<meta charset="UTF-8">
<title>도서 상세</title>
</head>
<body>
<%-- <p>${bookVO} --%>
<h1>도서 상세</h1>
<!-- BookController.java에서 mav.addObject("title", "도서생성"); -->
 <h5>${title}</h5> 
<!-- 
요청URI : /updatePost
요청파라미터 : {bookId=127, title=개똥이의 모험2, category=소설2, price=12002}
요청방식 : post
-->
<!-- /create URL 같지만 방식이 다르다 그래서 다른 요청이다 -->
<form id="frm" name="frm" action="/updatePost" method="post">
	<!-- 폼데이터 -->
	<input type="hidden" name="bookId" value="${bookVO.bookId }">
	제목 : <input type="text" name="title" value="${bookVO.title}" 
		    class="formdata" readonly placeholder="제목"> <br>
	카테고리 : <input type="text" name="category" value="${bookVO.category}" 
	           class="formdata" readonly placeholder="카테고리"><br>
	가격 : <input type="number" name="price" value="${bookVO.price}" 
	         class="formdata" readonly placeholder="가격"><br>
	<!-- 일반 모드 시작 -->
	<p id="p1"> 
		<input type="button" id="edit" value="수정">
		<input type="button" id="delete" value="삭제">
		<input type="button" id="list" value="목록">
	</p>
	<!-- 일반 모드 끝 -->
	<!-- 수정 모드 시작 -->
	<p id="p2" style ="display:none"> 
		<input type="submit" id="confirm" value="확인">
		<input type="button" id="cancel" value="취소">
	</p>
	<!-- 수정 모드 끝 -->
</form>
</body>
</html>