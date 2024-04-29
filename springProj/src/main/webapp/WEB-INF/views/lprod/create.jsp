<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnSubmit").on("click",function(){
		let lprodId = $("input[name='lprodId']").val();
		let lprodGu = $("input[name='lprodGu']").val();
		let lprodNm = $("input[name='lprodNm']").val();
		
		//JSON 오브젝트!!
		let data = {
				"lprodId":lprodId,
				"lprodGu":lprodGu,
				"lprodNm":lprodNm
		};
		//{"lprodId": "14","lprodGu": "P501","lprodNm": "분식류"}
		console.log("data: ", data);  
		/*
			요청URI :/lprod/createAjax
			요청파라미터(JSON -> String : serialize) : {"lprodId": "14","lprodGu": "P501","lprodNm": "분식류"}
			요청방식 :post
		*/
		$.ajax({
			url:"/lprod/createAjax",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data) , //json 오브젝트 라서 보낼수 없다 String 변환해서 보내야 한다
			type:"post",
			dataType:"text",
			success:function(result){
				//result : SUCCESS
				console.log("result:",result);
			
				if(result=="SUCCESS"){
					location.href="/lprod/list";
				}
			}
		});
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<h1>상품분류 등록</h1>

<!--
	요청URI : /lprod/create
	요청 파라미터 :{lprodId=14, lprodGu=P501, lprodNm=분식류}
	요청방식  :post
-->
<form action="/lprod/create" method="post">
	<p> 상품분류 아이디:<input type="number" name="lprodId" placeholder="상품분류 아이디(ex.14)"> </p>
	<p> 상품분류 코드 :<input type="text" name="lprodGu" required placeholder="상품분류 코드(ex.P501)"> </p>
	<p> 상품분류 명:<input type="text" name="lprodNm" placeholder="상품분류 명(ex. 분식류)"> </p>
	<input type="button" id="btnSubmit" value="등록">
</form>

</body>
</html>