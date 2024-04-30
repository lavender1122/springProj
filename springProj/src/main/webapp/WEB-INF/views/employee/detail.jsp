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
	$("#confirm").on("click",function(){
		let empNo=$("input[name='empNo']").val();
		let empName=$("input[name='empName']").val();
		let empAddress=$("input[name='empAddress']").val();
		let empTelno=$("input[name='empTelno']").val();
		let empSalary=$("input[name='empSalary']").val();
		let filename=$("input[name='filename']").val();
		
		let data={
				"empNo":empNo,
				"empName":empName,
				"empAddress":empAddress,
				"empTelno":empTelno,
				"empSalary":empSalary,
				"filename":filename
		}
		console.log(data);
		
		$.ajax({
			url:"/employee/updateAjax",
			contentType : "application/json;charset=utf-8",
			 data : JSON.stringify(data),
			 type:"post",
			 dataType:"json",
			 success:function(result){
			 	console.log("result : " , result);
	    		$("#p1").css("display","block");
	    		$("#p2").css("display","none");
	    			//readonly 속성 추가
	    		$(".formdata").attr("readonly",true);
			 }
		});
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
		$("#frm").attr("action","/employee/updatePost");
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
	//삭제버튼 클릭
	$("#delete").on("click",function(){
		//속성 변경 action="/deletePost" 변경
		$("#frm").attr("action","/employee/deletePost");
		let result = confirm("삭제하시겠습니까?");
		//확인:true / 취소 : false
		console.log("result:"+result);
		
		if(result > 0){ // true ==1
// 			$("#frm").submit();
		}else{
			alert("삭제가 취소되었습니다.");
		}
	});
	$("#delete").on("click",function(){
		let empNo=$("input[name='empNo']").val();
		let data={
				"empNo":empNo
		};
		console.log(data);
		$.ajax({
			url:"",
			contentType : "application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:
		})
	})
});
</script>
<meta charset="UTF-8">
<title>회원 상세</title>
</head>
<body>
<%-- <p>${bookVO} --%>
<h1>회원상세</h1>
<%--  <h5>${employeeVO}</h5>  --%>
 <div id="divForm">
	<form id="frm" name="frm" action="/employee/updatePost" method="post">
		<!-- 폼데이터 -->
		직원번호 : <input type="text" name="empNo" value="${employeeVO.empNo}" 
			      readonly placeholder="직원번호"> <br>
		이름 : <input type="text" name="empName" value="${employeeVO.empName}" 
		           class="formdata" readonly placeholder="이름"><br>
		주소 : <input type="text" name="empAddress" value="${employeeVO.empAddress}" 
		         class="formdata" readonly placeholder="주소"><br>
		연락처 : <input type="text" name="empTelno" value="${employeeVO.empTelno}" 
		         class="formdata" readonly placeholder="연락처"><br>
		급여 : <input type="number" name="empSalary" value="${employeeVO.empSalary}" 
		         class="formdata" readonly placeholder="급여"><br>
		증명사진 : <input type="text" name="filename" value="${employeeVO.filename}" 
		         class="formdata" readonly placeholder="증명사진"><br>
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