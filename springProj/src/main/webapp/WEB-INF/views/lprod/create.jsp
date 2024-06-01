<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
   getLprodId();
   /* 
      before : 선택한 요소의 앞에 내용 삽입
         after : 선택한 요소의 뒤에 내용 삽입
         prepend : 선택한요소의 자식요소 앞에 내용삽입
         append : 선택한요소의 자식요소 뒤에 내용삽입
    */
   //상품추가
   $("#btnPlus")
         .on(
               "click",
               function() {
                  let pAreaLen = $(".pArea").length;

                  let str = "<p class='pArea'>";
                  str += "<input type='text' name='productVOList["+pAreaLen+"].productId' id='productId"+pAreaLen+"' class='form-control col-sm-3 float-left' placeholder='상품아이디' />";
                  str += "<input type='text' name='productVOList["+pAreaLen+"].pname'     id='pname"+pAreaLen+"' class='form-control col-sm-3 float-left' placeholder='상품명' />";
                  str += "<input type='text' name='productVOList["+pAreaLen+"].unitPrice' id='unitPrice"+pAreaLen+"' class='form-control col-sm-3 float-left clsUnitPrice' placeholder='가격' />";
                  str += "</p>";
                  str += "<p style='clear:both;'></p>";
                  $("#btnSubmit").before(str);
               });

   $('.btn-primary').on('click', function() {
      let pArea = $(".pArea");
      let lprodGu = $("input[name='lprodGu']").val();

      for (let i = 0; i < pArea.length; i++) {
         console.log(lprodGu + (i + 1));
         $("input[id='productId" + i + "']").val(lprodGu + (i + 1));
      }
   })

   //next() 메서드는 선택한 요소의 다음 형제 요소를 반환함
   //   이 메서드는 DOM 요소의 다음 형제를 따라 이동함
   //next() 메서드와 유관한 메서드는 nextAll()과
   //   nextUntil() 메서드가 있음
   //nextAll() 메서드 : 선택한 요소의 다음 형제 요소를 모두 반환
   //nextUntil() 메서드 : 주어진 주 매개변수 사이에 있는 
   //   모든 다음 형제 요소를 반환함
   //<li> 요소 중에서 클래스 이름이 start인 요소의 형제 다음에 오는 요소를 선택함
   $("#btnMinus").on("click", function() {
      let pAreaLen = $(".pArea").length;
      //       console.log("pAreaLen",pAreaLen)

      if (pAreaLen < 2) {
         alert("최소 하나는 존재해야 합니다.");
         return;
      }

      $(".pArea").last().next().remove();
      $(".pArea").last().remove();

   })

   $("#btnSubmit").on(
         "click",
         function() {
            let lprodId = $("input[name='lprodId']").val();
            let lprodGu = $("input[name='lprodGu']").val();
            let lprodNm = $("input[name='lprodNm']").val();

            let formData = new FormData;

            formData.append("lprodId", lprodId);
            formData.append("lprodGu", lprodGu);
            formData.append("lprodNm", lprodNm);

            let fileObj = $('#pictures');

            let files = fileObj[0].files;
            console.log("files.length : ", files.length);

            for (let i = 0; i < files.length; i++) {
               formData.append("pictures", files[i])
            }
            /*
            <form>
               <input type="text" name="lprodId"..
               <input type="text" name="lprodGu"..
               <input type="text" name="lprodNm"..
               <input type="file" name="pictures"..
               <input type="file" name="pictures"..
               <input type="file" name="pictures"..
            </form>
             */
            $('.pArea').each(
                  function(idx, data) {
                     let productId = $(this).children().eq(0).val();
                     let pname = $(this).children().eq(1).val();
                     let unitPrice = $(this).children().eq(2).val();
                     console.log("productId : " + productId);
                     console.log("pname : " + pname);
                     console.log("unitPrice : " + unitPrice);

                     formData.append("productVOList[" + idx
                           + "].productId", productId);
                     formData.append("productVOList[" + idx
                           + "].pname", pname);
                     formData.append("productVOList[" + idx
                           + "].unitPrice", unitPrice);
                  });
            /*
                <input type="text" name="productVOList[0].productId" value="P5211" />
                <input type="text" name="productVOList[0].pname" value="라면" />
                <input type="text" name="productVOList[0].unitPrice" value="111" />
                <input type="text" name="productVOList[1].productId" value="P5212" />
                <input type="text" name="productVOList[1].pname" value="떡볶이" />
                <input type="text" name="productVOList[1].unitPrice" value="222" />
               </form>
             */
            //       $.ajax({
            //          url:"/lprod/createFormData",
            //          processData:false,
            //          contentType:false,
            //          data:formData,
            //          type:"post",
            //          dataType:"text",
            //          success:function(result){
            //             console.log("result : ",result);
            //          }
            //       });
            //JSON 오브젝트!!
            let data = {
               "lprodId" : lprodId,
               "lprodGu" : lprodGu,
               "lprodNm" : lprodNm
            };

            //{"lprodId": "14","lprodGu": "P501","lprodNm": "분식류"}
            console.log("data: ", data);
            //       /*
            //          요청URI :/lprod/createAjax
            //          요청파라미터(JSON -> String : serialize) : {"lprodId": "14","lprodGu": "P501","lprodNm": "분식류"}
            //          요청방식 :post
            //       */
            //       $.ajax({
            //          url:"/lprod/createAjax",
            //          contentType:"application/json;charset=utf-8",
            //          data:JSON.stringify(data) , //json 오브젝트 라서 보낼수 없다 String 변환해서 보내야 한다
            //          type:"post",
            //          dataType:"text",
            //          success:function(result){
            //             //result : SUCCESS
            //             console.log("result:",result);

            //             if(result=="SUCCESS"){
            //                location.href="/lprod/list";
            //             }
            //          }
            //       });
         });
});//$function End

function getLprodId() {
   //ajax
   $.ajax({
      url : "/lprod/getLprodId",
      //       contentType//보내는 값없어서 생략
      type : "post",
      dateType : "text",
      success : function(result) {
         //          console.log("result:",result);
         $("input[name='lprodId']").val(result);
      }
   })
}

function fn_check(){
   console.log("왔다")
   $(".clsUnitPrice").each(function(){
	   let str = $(this).val()
	   
	   console.log("str:"+str);
	   
	   if(str==""){
		   alert("상품가격을 입력해주세요")
		   flag=0;
	   }
   });
   if(flag==1){
	   return true; // false 리턴 시 submit 실행 X
   }else{
	   return false;
   }
   
}
</script>
<title>Insert title here</title>
</head>
<body>
   <h1>상품분류 등록</h1>

   <!--
   요청URI : /lprod/create
   요청 파라미터 :{lprodId=14, lprodGu=P501, lprodNm=분식류, pictures=파일객체들}
   요청방식  :post
   -->
   <form:form modelAttribute="lprodVO" action="/lprod/create"
      method="post" enctype="multipart/form-data" onsubmit="return fn_check()">
      <p>
         상품분류 아이디 :
         <form:input path="lprodId" placeholder="상품분류 아이디(ex.14)"
            readonly="true" />
         <code><form:errors path="lprodId" /></code>
      </p>
      <p>
         상품분류 코드 :
         <form:input path="lprodGu" placeholder="상품분류 코드(ex.P501)"
            required="true" />
         <code><form:errors path="lprodGu" /></code>
         <button type="button" id="btnAuto"
            class="btn btn-primary btn-xs col-sm-1">상품코드 자동생성</button>
      </p>
      <p>
         상품분류 명 :
         <form:input path="lprodNm" placeholder="상품분류 명(ex. 분식류)" />
         <code><form:errors path="lprodNm" /></code>
      </p>
      <hr />
      <p>
         <input type="file" name="pictures" id="pictures" multiple />
      </p>
      <p id="pFunc">
         <button type="button" class="btn btn-info btn-sm col-sm-1"
            id="btnPlus">+</button>
         <button type="button" class="btn btn-danger btn-sm col-sm-1"
            id="btnMinus">-</button>
      </p>
      <!-- 
      1) + : 영역이 하나 생김
      2) - : 마지막 영역 삭제
     -->
      <p class="pArea">
         <form:input path="productVOList[0].productId" id="productId0"
            class="form-control col-sm-3 float-left" placeholder="상품아이디" />
         <code><form:errors path="productVOList[0].productId" /></code>
         
         <form:input path="productVOList[0].pname" id="pname0"
            class="form-control col-sm-3 float-left" placeholder="상품명" />
         <code><form:errors path="productVOList[0].pname" /></code>
         
         <form:input path="productVOList[0].unitPrice" id="unitPrice0"
            class="form-control col-sm-3 float-left clsUnitPrice" placeholder="가격" />
         <code><form:errors path="productVOList[0].unitPrice" /></code>
      </p>
      <p style="clear: both;"></p>
      <p>
         <!--        <input type="submit" id="btnSubmit" value="등록"> -->
         <form:button name="btnSubmit">등록</form:button>
      </p>
   </form:form>
   <!-- <form action="/lprod/create" method="post" enctype="multipart/form-data"> -->
   <!--    <p> 상품분류 아이디 : <input type="number" name="lprodId" placeholder="상품분류 아이디(ex.14)"> </p> -->
   <!--    <p>  -->
   <!--          상품분류 코드 : <input type="text" name="lprodGu" required placeholder="상품분류 코드(ex.P501)"> -->
   <!--          <button type="button" class="btn btn-primary btn-xs col-sm-1">상품코드 자동생성</button> -->
   <!--    </p> -->
   <!--    <p> 상품분류 명 : <input type="text" name="lprodNm" placeholder="상품분류 명(ex. 분식류)"> </p> -->
   <!--    <hr /> -->
   <!--    <p> -->
   <!--       <input type="file" name="pictures" id="pictures" multiple /> -->
   <!--    </p> -->
   <!--    <p id="pFunc"> -->
   <!--       <button type="button" class="btn btn-info btn-sm col-sm-1" id="btnPlus" >+</button> -->
   <!--       <button type="button" class="btn btn-danger btn-sm col-sm-1" id="btnMinus" >-</button> -->
   <!--     </p> -->
   <!--     
<!--       1) + : 영역이 하나 생김 -->
   <!--       2) = : 마지막 영역 삭제 -->
   <!--      -->
   <!--     <p class="pArea"> -->
   <!--       <input type="text" name="productVOList[0].productId" id="productId0" class="form-control col-sm-3 float-left" placeholder="상품아이디"> -->
   <!--       <input type="text" name="productVOList[0].pname"       id="pname0" class="form-control col-sm-3 float-left" placeholder="상품명"> -->
   <!--       <input type="text" name="productVOList[0].unitPrice" id="unitPrice0" class="form-control col-sm-3 float-left" placeholder="가격"> -->
   <!--     </p> -->
   <!--     <p style="clear: both;"></p> -->
   <!--     <p> -->
   <!--        <input type="button" id="btnSubmit" value="등록"> -->
   <!--     </p> -->
   <!-- </form> -->

</body>
</html>