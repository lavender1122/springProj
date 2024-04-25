<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	let lprodId="${lprodVO.lprodId}";
	let lprodGu="${lprodVO.lprodGu}";
	let lprodNm="${lprodVO.lprodNm}";
$(function(){
	   //일반모드와 수정모드를 toggle해보자
	   //lprodGu는 계속 readonly상태
	   //lprodId, lprodNm은 readonly toggle
	   $("#list").on("click",function(){
		   location.href="/lprod/list";
	   });
	   //수정 버튼 누르면
	   $("#edit").on("click",function(){
// 		   console.log("ch");
			$("#p1").css("display","none");
			$("#p2").css("display","block");
			//readonly(읽기 모드) 속성 제거
			$(".formdata").removeAttr("readonly");
			//action 속성의 값이/lprod/updatePost
	   });
	   //취소버튼 클릭시!
	   $("#cancel").on("click",function(){
		   $("#p1").css("display","block");
		$("#p2").css("display","none");
			//readonly(읽기 모드) 속성 추가
			$(".formdata").attr("readonly",true);
		//입력 초기화
		console.log(lprodId,lprodGu,lprodNm);
		$("input[name='lprodId']").val(lprodId);
		$("input[name='lprodGu']").val(lprodGu);
		$("input[name='lprodNm']").val(lprodNm);
	   })
	   //삭제버튼
	   $("#delete").on("click",function(){
		 //action 속성의 값이/lprod/deletePost 변경
		   $("#frm").attr("action","/lprod/deletePost");
		   let result=confirm("삭제하시겠습니까");
			 //확인:true / 취소 : false
			console.log("result:"+result);
			
			if(result > 0){ // true ==1
				$("#frm").submit();
			}else{
				alert("삭제가 취소되었습니다.");
			}
	   })
	   
});
</script>
</head>
<body>
<h1>상품분류 상세</h1>
<!-- 
   요청URI : /lprod/update
   요청파라미터 : {lprodId=14,lprodGu=P501, lprodNm=분식류}
   요청방식 : post
 -->
 ${lprodVO}
 <form name="frm" id="frm" action="/lprod/updatePost" method="post">
    <p><input type="number" name="lprodId" value="${lprodVO.lprodId}" readonly class="formdata" placeholder="상품분류 아이디(ex. 14)" /></p>
    <p><input type="text" name="lprodGu"  value="${lprodVO.lprodGu}" readonly  placeholder="상품분류 코드(ex. P501)" required /></p>
    <p><input type="text" name="lprodNm"  value="${lprodVO.lprodNm}" readonly class="formdata" placeholder="상품분류 명(ex. 분식류)" /></p>
    <!-- ///// 일반모드 시작 ///// -->
   <p id="p1">
      <input type="button" id="edit" value="수정" />
      <input type="button" id="delete" value="삭제" />
      <input type="button" id="list" value="목록" />
   </p>
   <!-- ///// 일반모드 끝 ///// -->
   <!-- ///// 수정모드 시작 ///// -->
   <p id="p2" style="display:none">
      <input type="submit" id="confirm" value="확인" />
      <input type="button" id="cancel" value="취소" />
   </p>
   <!-- ///// 수정모드 끝 ///// -->
 </form>
</body>
</html>