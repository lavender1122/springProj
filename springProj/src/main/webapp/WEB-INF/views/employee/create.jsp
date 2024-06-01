<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/sweetalert2.min.js"></script>
<title>Employee</title>
<script type="text/javascript">
$(function(){
	//다음 우편번호 검색
	$("#btnPost").on("click",function(){
		new daum.Postcode({
			//다음 창에서 검색이 완료되면 콜백함수에 의해
			//결과 데이터가 data 객체로 들어옴
			oncomplete:function(data){
				$("#postNum").val(data.zonecode);
				$("input[name='empAddress']").val(data.address);
				$("#empAddress2").val(data.buildingName);
				
				//sweetalert띄어보자 3초간 보임
				var Toast = Swal.mixin({
					toast:true,
					position:"top-end",
					showConfirmButton:false,
					timer:3000
				});
				Toast.fire({
					icon:"success",
					title:"우편번호가 검색되었습니다."
				})
			}
		}).open();
	});
	getToday()
	$("#btnPlus").on("click",function(){
		let pAreaLen = $(".pArea").length;
		let str = "";
        str += "<p class='pArea'>";
        str += "<input type='text' name='licenseVOList["+pAreaLen+"].licNo' id='licNo"+pAreaLen+"' class='form-control col-sm-3 float-left' placeholder='자격증 번호'>";
        str += "<input type='text' name='licenseVOList["+pAreaLen+"].licNm' id='licNm"+pAreaLen+"' class='form-control col-sm-3 float-left' placeholder='자격증 명'>";
        str += "<input type='date' name='licenseVOList["+pAreaLen+"].licDt' id='licDt"+pAreaLen+"' class='form-control col-sm-3 float-left clsUnitPrice' placeholder='발급 일'>";
        str += "</p>";
        str += "<p style='clear:both;'></p>";
     
     $("#btnSubmit").parent().before(str);
	});
	$("#btnMinus").on("click",function(){
      let pAreaLen = $(".pArea").length;
      console.log("pAreaLen : ", pAreaLen);
      
      if(pAreaLen < 2) {
         alert("최소 하나는 존재해야 합니다.");
         return;
      }
      
      // next는 선택한 요소의 다음 형제 요소를 반환
      $(".pArea").last().next().remove();
      $(".pArea").last().remove();
   });
	$("#btnSubmit").on("click",function(){
	    let empNo = $("input[name='empNo']").val();
	    let empName = $("input[name='empName']").val();
	    let empAddress = $("input[name='empAddress']").val();
	    let empTelno = $("input[name='empTelno']").val();
	    let empSalary = $("input[name='empSalary']").val();

	    let formData = new FormData();
	    formData.append("empNo", empNo);
	    formData.append("empName", empName);
	    formData.append("empAddress", empAddress);
	    formData.append("empTelno", empTelno);
	    formData.append("empSalary", empSalary);

	    let inputFile = $("input[name='uploadFile']");
	    let files = inputFile[0].files; // 파일 업로드 input에서 선택된 파일들을 가져옵니다.

        formData.append("uploadFile", files[0]);
	    
	    //<pArea>-------------------------------------------------
	    $(".pArea").each(function(idx,data){
	    	let licNo =$(this).children().eq(0).val();
	    	let licNm =$(this).children().eq(1).val();
	    	let licDt =$(this).children().eq(2).val();

	    	
	    	formData.append("licenseList["+idx+"].licNo",licNo);
	    	formData.append("licenseList["+idx+"].licNm",licNm);
	    	formData.append("licenseList["+idx+"].licDt",licDt);
	    });
// 	    $.ajax({
// 	        url: "/employee/createFormData",
// 	        processData: false,
// 	        contentType: false,
// 	        data: formData,
// 	        type: "POST",
// 	        dataType: "text",
// 	        success: function(result) {
// 	            console.log("result", result);
// 	        },
// 	        error: function(xhr, status, error) {
// 	            console.log("Error:", error);
// 	        }
// 	    });
		//----------------------------------------------------------
		
// 		let data={
// 				"empNo":empNo,
// 				"empName":empName,
// 				"empAddress":empAddress,
// 				"empTelno":empTelno,
// 				"filename":filename
// 		}
		//동기로 전송
		// $.ajax({ 
		// 	url:"/employee/createAjax",
		// 	contentType:"application/json;charset=utf-8",
		// 	data:JSON.stringify(data),
		// 	type:"post",
		// 	dataType:"json",
		// 	success:function(result){
		// 	console.log("result",result);
		// 	location.href="employee/list"
		// 	}
		// })
		
	});
})
function fn_check(){
	console.log("왔다")
// 	  $(".clsUnitPrice").each(function(){
// 		   let str = $(this).val()
		   
// 		   console.log("str:"+str);
		   
// 		   if(str==""){
// 			   alert("상품가격을 입력해주세요")
// 			   flag=0;
// 		   }
// 	   });
// 	   if(flag==1){
		   return true; // false 리턴 시 submit 실행 X
// 	   }else{
// 		   return false;
// 	   }
}
function getToday(){
	let today = new Date();
	let year= today.getFullYear();
	let month = ('0' +(today.getMonth()+1)).slice(-2);
	let day= ('0' + today.getDate()).slice(-2);
	
	let dateString = year+"-"+month+"-"+day;
	
	console.log("dateString",dateString);
	let obj =document.querySelector("#unitPrice0")
	obj.value=dateString
}
</script>
</head>
<body>
<h1>직원등록</h1>
<!-- BookController.java에서 mav.addObject("title", "도서생성"); -->
	<!--
	   요청URI : /employee/create
	   요청파라미터 : {empNo=A011, empName=개똥이, empAddress=세종시 새롬중앙로 11, empTelno=010-5656-2222, empSalary=5000000, filename=파일객체}
	   요청방식 : post
	   
	   return 타입 : ModelAndView
	   model.setViewName("redirect:/employee/create");
	1. 스프링폼
		- empNo, empName, empAddress,empTelno,empSalary,licenseList[0].licNo,licenseList[0].licNm,licenseList[0].licDt
		- form:errors path.. 처리
		
	2.컨트롤러
	-골뱅이 Validated
	-BindingResult -> brResult.hasErros()
	
	3.자바빈 클래스(vo)
	-String 타입 : NotBlank
	-int 타입: Range(min=1, message...)
	 -->
<form:form modelAttribute="employeeVO" id="frm" action="/employee/create" method="post" enctype="multipart/form-data"
	onsubmit="return fn_check()">
	<p><form:input  path="empNo"       placeholder="직원 번호 (ex.A011)"/></p>
	<code><form:errors path="empNo"/></code>
	<p><form:input  path="empName"     placeholder="직원 명 (ex.개똥이)"/></p>
	<code><form:errors path="empName"/></code>
	<p>
		<input type="text" name="postNum" id="postNum" readonly placeholder="우편번호">
		<button type="button" id="btnPost"> 우편번호 검색</button>
	</p>
	<p>
		<input type="text" name="empAddress2" id="empAddress2" placeholder="직원상세주소">
	</p>
	<p><form:input  path="empAddress"  placeholder="직원 주소(ex.세종시 새롬중앙로 11)"/></p>
	<code><form:errors path="empAddress"/></code>
	<p><form:input  path="empTelno"    placeholder="직원 연락처(ex.010-5656-2222)"/></p>
	<code><form:errors path="empTelno"/></code>
	<p><input type="number"  name="empSalary"    placeholder="직원 급여(ex. 5000000)"/></p>
	<code><form:errors path="empSalary"/></code>
	<!-- multiple 안씀 => EMPLOYEE : 증명사진 : 1:1  -->
	<p>
		<input type="file" name="uploadFile"  placeholder="증명사진">
		<label for ="uploadFile" class="btn btn-info btn-sm col-sm-1">증명사진 선택</label>
	</p> 
<!-- 	<hr/> -->
<!--     <p> -->
<!-- 		<input type="text" name="licNo" placeholder="자격증번호" required /> -->
<!--     </p> -->
<!--     <p><input type="text" name="licNm" placeholder="자격증 명" /></p> -->
<!--     <p><input type="date" name="licDt" placeholder="발급일" /></p> -->
    <hr />
    <p id="pFunc">
		<button type="button" class="btn btn-info btn-sm col-sm-1" id="btnPlus" >+</button>
		<button type="button" class="btn btn-danger btn-sm col-sm-1" id="btnMinus" >-</button>
    </p>
	<p class="pArea">
		<form:input  path="licenseList[0].licNo" id="productId0" class="form-control col-sm-3 float-left" placeholder="자격증번호"/>
		<code><form:errors path="licenseList[0].licNo"/></code>
		<form:input  path="licenseList[0].licNm" id="pname0" class="form-control col-sm-3 float-left" placeholder="자격증 명"/>
		<code><form:errors path="licenseList[0].licNm"/></code>
		<form:input  path="licenseList[0].licDt" id="unitPrice0" class="form-control col-sm-3 float-left clsUnitPrice" placeholder="발급일"/>
		<code><form:errors path="licenseList[0].licDt"/></code>
	 </p>
	 <p style="clear:both;"></p>
	 <p><form:button name="btnSubmit">등록</form:button></p>
</form:form>
</body>
</html>