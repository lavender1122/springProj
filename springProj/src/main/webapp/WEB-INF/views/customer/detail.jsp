<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" 
   rel="stylesheet">
<title></title>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
let cstNo = "${customerVO.cstNo}";
let cstName = "${customerVO.cstName}";
let cstAddress = "${customerVO.cstAddress}";
let cstTelno = "${customerVO.cstTelno}";

//document 내의 모든 요소들이 로딩된 후에 실행
//1개의 jsp에 1만 사용하자
$(function(){
   $("#list").on("click", function(){
      location.href="/customer/list";
   });
   
   // 수정 버튼 클릭 -> 수정 버튼 전환
   $("#edit").on("click", function(){
      $("#p1").css("display","none");
      $("#p2").css("display","block");
      
      // readonly의 속성을 제거함
      $(".formdata").removeAttr("readonly");
   });
   
   // 취소 버튼 클릭
   $("#cancel").on("click",function(){
      $("#p1").css("display","block");
      $("#p2").css("display","none");
      //readonly 속성을 추가
      $(".formdata").attr("readonly",true);
      //입력란 초기화
      $("input[name='cstNo']").val(cstNo);
      $("input[name='cstName']").val(cstName);
      $("input[name='cstAddress']").val(cstAddress);
      $("input[name='cstTelno']").val(cstTelno);
      
      console.log("name : " + name + ", email : " + email + ", subject : " + subject + ", message : " + message);
   });
   
   // 삭제 버튼 클릭
   $("#delete").on("click",function(){
      $("#frm").attr("action", "/customer/deletePost");
      
      let result = confirm("삭제하시겠습니까?");
      // 확인 : true / 취소 : false
      console.log("result : " + result);
      
      if(result > 0) { //true
         $("#frm").submit();
      
      } else { //false
         alert("삭제가 취소되었습니다.");
         return;
      }
   });
});
</script>
</head>
<body>
   <div class="content-wrapper" style="min-height: 2646.44px;">

      <section class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-6">
                  <h1>Contact us</h1>
               </div>
               <div class="col-sm-6">
                  <ol class="breadcrumb float-sm-right">
                     <li class="breadcrumb-item"><a href="#">Home</a></li>
                     <li class="breadcrumb-item active">Contact us</li>
                  </ol>
               </div>
            </div>
         </div>
      </section>

      <section class="content">
         <form id="frm" action="/customer/updatePost" method="post">
            <div class="card">
               <div class="card-body row">
                  <div
                     class="col-5 text-center d-flex align-items-center justify-content-center">
                     <div class="">
                        <h2>
                           Admin<strong>LTE</strong>
                        </h2>
                        <p class="lead mb-5">
                           123 Testing Ave, Testtown, 9876 NA<br> Phone: +1 234
                           56789012
                        </p>
                     </div>
                  </div>
                  <div class="col-7">
                     <div class="form-group">
                        <label for="inputName">번호</label>
                        <input type="text" name="cstNo" value="${customerVO.cstNo}" readonly
                           id="inputName" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="inputEmail">직원이름</label>
                        <input type="text" name="cstName" value="${customerVO.cstName}" readonly
                           id="inputEmail" class="form-control formdata">
                     </div>
                     <div class="form-group">
                        <label for="inputSubject">주소</label>
                        <input type="text" name="cstAddress" value="${customerVO.cstAddress}" readonly
                           id="inputSubject" class="form-control formdata">
                     </div>
                     <div class="form-group">
                        <label for="inputMessage">전화번호</label>
                        <textarea id="inputMessage" name="cstTelno" class="form-control formdata" rows="4" readonly>${customerVO.cstTelno}</textarea>
                     </div>
                     
                     <!-- //// 일반모드 시작 //// -->
                     <p id="p1">
                        <input type="button" class="btn btn-primary" id="edit" value="수정">
                        <input type="button" class="btn" id="delete" value="삭제">
                        <input type="button" class="btn" id="list" value="목록">
                     </p>
                     <!-- //// 일반모드 끝 //// -->
                     
                     <!-- //// 수정모드 시작 //// -->
                     <p id="p2" style="display: none">
                        <input type="submit" class="btn btn-primary" id="confirm" value="확인">
                        <input type="button" class="btn" id="cancel" value="취소">
                     </p>
                     <!-- //// 수정모드 끝 //// -->
                  </div>
               </div>
            </div>
         </form>
      </section>

   </div>
</body>
</html>