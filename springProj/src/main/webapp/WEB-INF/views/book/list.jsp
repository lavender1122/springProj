<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/sweetalert2.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>도서 목록</title>
<script type="text/javascript">
$(function(){
	//도서 상세 모달
	$(".clsBookId").on("click",function(){
	//<td class="clsBookId" data-book-id="131">1</td>
// 	console.log("bookId:"+bookId);
	let bookId= $(this).data("bookId");
	let data={
			"bookId":bookId
	}
	console.log("data",data);
	//js세션
	sessionStorage.setItem("bookId",bookId);
	//비동기
	//contentType : 보내는 타입
	//dataType : 응답 타입
	$.ajax({
		url:"/datailAjax",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		dataType:"json",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success:function(result){
			console.log("result:",result);
			console.log("result:",result.bookId);
			
			let day = new Date(result.insertDate);
			
			let year = day.getFullYear();
			let month = day.getMonth();
			let date = day.getDate();
			
			let allDate = year + "-" + month + "-" + date
			console.log(allDate)
			
			$("#modalBookTitle").html(result.title);
			$("#modalCategory").val(result.category);
			$("#modalPrice").val(result.price);
			$("#modalInsertDate").val(result.insertDateStr);
			
			$("#btnCancel").on("click",function(){
				$("#modalCategory").val(result.category);
				$("#modalPrice").val(result.price);
				$("#modalInsertDate").val(result.insertDateStr);

				$(".btnConfirm").css("display","none");
				$("#btnModify").css("display","block");
				$(".clsInput").attr("readonly",true);
			})
		}
	})
	});
	$("#btnSearch").on("click",function(){
		let keyword =$("input[name='keyword']").val();
		
		//json오브젝트
		let data={
				"keyword":keyword
		};
		console.log("data:",data)
		//this => 내가 바로 클릭한것
// 		$(this).parent().submit();
		//새롭게 검색: 1페이지로 초기화
		getList(keyword,1);
	});
	
	$("#btnSearchAll").on("click",function(){
		//새롭게 검색: 1페이지로 초기화
		getList("",1);
	});
	
	//목록 함수 호출
// 	getList("");
	$("#btnModify").on("click",function(){
		
		$(".btnConfirm").css("display","block");
		$("#btnModify").css("display","none");
		$(".clsInput").attr("readonly",false);
	});//#btnModify end
	
	$("#btnOk").on("click",function(){
		
		let modalCategory =$("#modalCategory").val();
		let modalPrice = $("#modalPrice").val();
		let modalInsertDate = $("#modalInsertDate").val();
// 		console.log(modalCategory+","+modalPrice+","+modalInsertDate);

		let data ={
				"bookId":sessionStorage.getItem("bookId"),
				"category":modalCategory,
				"price":modalPrice,
				"insertDate	":modalInsertDate
		}
		console.log("data>>",data);
		$.ajax({
			url:"/updatePost",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(result){
				console.log("result>>",result);
				
				
				var Toast = Swal.mixin({
					toast:true,
					position:"top-end",
					showConfirmButton:false,
					timer:3000
				});
				Toast.fire({
					icon:"success",
					title:"등록되었습니다."
				})
				
				//list 비동기로 새로 고침
				getList("",1);
				//모달 닫기
// 				$("#modalBook").modal("hide");
			}
		})
		
	})

});//$function end
//목록
function getList(keyword,currentPage){
	//json오브젝트
	let data= {
			"keyword":keyword,
			"currentPage":currentPage
	}
	
	//data:{"keyword":"알탄","currentPage":"1"}
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
			//result:articlePage
			//result.content:List<Book>
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
			$(".clsPagingArea").html(result.pagingArea)
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
       <c:forEach var="bookVO" items="${articlePage.content}"  varStatus="stat">
		<tr>
			<td class="clsBookId" data-toggle="modal" data-target="#modalBook"
			 data-book-id="${bookVO.bookId}">${bookVO.rnum}</td>
			<td><a href="/detail?bookId=${bookVO.bookId}"> ${bookVO.title}</a></td>
			<td>${bookVO.category}</td>
			<td><fmt:formatNumber value="${bookVO.price}" pattern="#,###"/>
		</tr>
       </c:forEach>
	</tbody>
</table>
<hr/>
<div class="row clsPagingArea">
	${articlePage.pagingArea}
<!-- test 시작 -->
           
<!-- test 끝 -->           
</div>
<div class="modal fade" id="modalBook">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">
           <div class="modal-header">
             <h4 class="modal-title" id="modalBookTitle"></h4>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
             </button>
           </div>
           <div class="modal-body" id="modalBookBody">
           <input type="hidden" value="${bookVO}">
			 카테고리 : <input type="text" class="form-control clsInput" id="modalCategory" readonly/><br> 
			 가&nbsp;&nbsp;&nbsp;격 : <input type="text" class="form-control clsInput" id="modalPrice"readonly/><br> 
			 등&nbsp;록&nbsp;일 : <input type="text" class="form-control clsInput" id="modalInsertDate"readonly/><br> 
			          
           </div>
           <div class="modal-footer justify-content-between">
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
             <button type="button" class="btn btn-primary btnEdit float-right" id="btnModify" >수정</button>
             <button type="button" class="btn btn-success btnConfirm" style="display:none;" id="btnOk">확인</button>
             <button type="button" class="btn btn-warning btnConfirm" style="display:none;" id="btnCancel">취소</button>
           </div>
         </div>
         <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
 </div>
 <!-- /.modal -->
 <hr/>
</body>
</html>