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
	//내용수정
	$("#confirm").on("click",function(){
		let dataArray= $("#frm").serializeArray();
		
		console.log("dataArray",dataArray);
		
		//json
		let data={};
		//dataArray.map => 배열을 map으로 처리함
		dataArray.map(function(row,idx){
			//key   value
			data[row.name]=row.value;
		});
		console.log("data:", data)
		/*
	      let data = {
	         "bookId":"136",
	         "title":"더개똥이",
	         "category":"소설",
	         "price":"12002"
	      }
	      */
	      $.ajax({
	    	  url:"/updateAjax",
	    	  contentType:"application/json;charset=utf-8",
	    	  data:JSON.stringify(data),
	    	  type:"post",
	    	  dataType:"json",
	    	  success:function(result){
	    		  console.log("result",result)
	    		  
	    		  $("#p1").css("display","block");
	    			$("#p2").css("display","none");
	    			//readonly 속성 추가
	    			$(".formdata").attr("readonly",true);
	    	  }
	    	  
	      })
	});
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
// 			$("#frm").submit();
		}else{
			alert("삭제가 취소되었습니다.");
		}
	});
	//삭제버튼
	$("#delete").on("click",function(){
		let bookId=$("input[name='bookId']").val();
		let data={
				"bookId":bookId
		};
		console.log("data :",data);//ok
		$.ajax({
			url:"/deleteAjax",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			success : function(result) {
                // result : lprodVO
                console.log("result : " , result);
                console.log("result : " , JSON.stringify(result));
				getList("");
			}    
		});
	})
});//$function end
function getList(keyword){
	let data= {
			"keyword":keyword
	}
   $.ajax({
	      url:"/listAjax",
	      contentType:"application/json;charset=utf-8",
	      data:JSON.stringify(data),
	      type:"post",
	      dataType:"json",
	      success:function(result){
	    	console.log("listAjax->result : ",result);
	    	
	    	$("h1").html("도서 목록");
	    	$("#divForm").html("");
	         
	         let str = "";
	         
	         str += "<table border='1'>";
	         str += "<thead>";
	         str += "<tr>";
	         str += "<th>제목</th><th>카테고리</th><th>가격</th>";
	         str += "</tr>";
	         str += "</thead>";
	         str += "<tbody>";
	         
	         $.each(result,function(idx,bookVO){
	 			str +="<tr>";
	 			str +="<td>"+(idx+1)+"</td>";
	 			str +="<td><a href='/detail?bookId="+bookVO.bookId+"'>"+bookVO.title+"</a></td>";
	 			str +="<td>"+bookVO.category+"</td>";
	 			str +="<td>"+bookVO.price+"원</td>";
	 			str +="</tr>";
	 		});
	 			$("#divForm").html(str);
	 			 // 검색 영역 추가
//  	         let searchStr = "";
 	         
//  	         searchStr += "<div>";
//  	         searchStr += "<form>";
//  	         searchStr += "<input type='text' name='keyword' value='"+keyword+"' placeholder='검색어를 입력하세요' />";
//  	         searchStr += "<button type="button" id="btnSearch">검색</button>";
//  	         searchStr += "</form>";
//  	         searchStr += "</div>";
 	         
 	         //요소.prev() : 요소의 이전 요소 선택.
//  	         $("#divForm").prev().remove();
//  	         $("#divForm").before(searchStr);	 			
	      }
	  });
}

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
<div id="divForm">
	<form id="frm" name="frm" action="/updatePost" method="post">
		<!-- 폼데이터 -->
		<input type="hidden" name="bookId" value="${bookVO.bookId}">
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
			<input type="button" id="confirm" value="확인">
			<input type="button" id="cancel" value="취소">
		</p>
		<!-- 수정 모드 끝 -->
	</form>
</div>
</body>
</html>