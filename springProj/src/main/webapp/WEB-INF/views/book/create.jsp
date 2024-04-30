<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#btnSave").on("click",function(){
		let data=$("#frm").serialize();
		let dataArray=$("#frm").serializeArray();
		
		console.log("data:", data);
		console.log("dataArray:", dataArray);
		let param={};
		
		dataArray.map(function(data,index){
		//    key				value
			param[data.name] = data.value;
		});
		console.log("param:", param);
		//-------------------------------------
		let title=$("input[name='title']").val();
		let category=$("input[name='category']").val();
		let price=$("input[name='price']").val();
		
		let jsonObj = {
				"title":title,
				"category":category,
				"price":price
		}
		console.log("jsonObj:", jsonObj);
		
		//post : I/U/D(DB 변화 있음)
		//get : select(DB 변화 없음)
		$.ajax({
			url:"/createAjax",
			contentType:"application/json;charset=utf-8",
			data	:JSON.stringify(param),
			type:"post",
			dataType:"json",
			success:function(result){
				console.log("result:",result);
				if(result!=null){
					location.href="/list";
				}
			}
		});
		
	});
});
</script>
</head>
<body>
<h1>책 등록</h1>
<!-- BookController.java에서 mav.addObject("title", "도서생성"); -->
<h5>${title}</h5>
<!-- 
요청URI : /crate
요청파라미터 : {title=개똥이의 모험, category=소설, price=12000}
요청방식 : post
-->
<!-- /create URL 같지만 방식이 다르다 그래서 다른 요청이다 -->
<form id="frm" action="/create" method="post">
	<!-- 폼데이터 -->
	제목 : <input type="text" name="title" placeholder="제목"> <br>
	카테고리 : <input type="text" name="category"placeholder="카테고리"><br>
	가격 : <input type="number" name="price" placeholder="가격"><br>
	<input type="button" id="btnSave" value="저장">
</form>
</body>
</html>