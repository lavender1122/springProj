<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
   let lprodId = "${lprodVO.lprodId}";
   let lprodGu = "${lprodVO.lprodGu}";
   let lprodNm = "${lprodVO.lprodNm}";

   $(function(){
      //비동기 처리
      $("#confirm").on("click",
            function() {
               let lprodId = $("input[name='lprodId']").val();
               let lprodGu = $("input[name='lprodGu']").val();
               let lprodNm = $("input[name='lprodNm']").val();

               //JSON 오브젝트
               let data = {
                  "lprodId" : lprodId,
                  "lprodGu" : lprodGu,
                  "lprodNm" : lprodNm
               };

               console.log("data : ", data);

               $.ajax({
                  url : "/lprod/updateAjax",
                  contentType : "application/json;charset=utf-8",
                  data : JSON.stringify(data),
                  type : "post",
                  dataType : "json",
                  success : function(result) {
                     // result : lprodVO
                     console.log("result : " + result);

                     if (result != null) {
                        location.href = "/lprod/detail?lprodGu="
                              + result.lprodGu;
                     }
                  }
               });
            });

      $("#list").on("click", function() {
         location.href = "/lprod/list";
      });

      //일반모드와 수정모드를 toggle해보자
      //lprodGu는 계속 readonly상태
      //lprodId, lprodNm은 readonly toggle
      // 수정 버튼 클릭 -> 수정 모드로 전환
      $("#edit").on("click", function() {
         $("#p1").css("display", "none");
         $("#p2").css("display", "block");

         $("input[name='lprodId']").removeAttr("readonly");
         $("input[name='lprodNm']").removeAttr("readonly");

         // action 속성의 값이 /lprod/update
         $("#frm").attr("action", "/lprod/updatePost");
      });

      // 삭제 버튼 클릭
      $("#delete").on("click", function() {
         let lprodGu = $("input[name='lprodGu']").val();

         //JSON 오브젝트
         let data = {
            "lprodGu" : lprodGu
         };

         console.log("data : ", data);

         let result = confirm("삭제하시겠습니다?");
         console.log("result : ", result);

         if (result > 0) { // 확인
            $.ajax({
               url : "/lprod/deleteAjax",
               contentType : "application/json;charset=utf-8",
               data : JSON.stringify(data),
               type : "post",
               dataType : "json",
               success : function(result) {
                  // result : lprodVO
                  console.log("result : " + JSON.stringify(result));
   
                  // 목록 불러오기 ""로 던짐
                  getList("");
               }
            });
         } else { // 취소
            alert("삭제가 취소되었습니다.");
         }
      });

      // 취소 버튼 클릭
      $("#cancel").on("click", function() {
         $("#p1").css("display", "block");
         $("#p2").css("display", "none");

         $("input[name='lprodId']").attr("readonly", true);

         $("input[name='lprodId']").val(lprodId);
         $("input[name='lprodNm']").val(lprodNm);
      });
      
      //btnSearch 요소를 클릭 시 검색 처리
      // 동적으로 생성된 요소의 경우 document구문으로 처리해야 함
      $(document).on("click", "#btnSearch", function(){
         // 검색어
         let keyword = $("input[name='keyword']").val();
         console.log("keyword : " + keyword);
         
         // 검색도 ajax로 처리
         getList(keyword);
      });

   });//#function end
   
// 목록 불러오기
function getList(keyword) {
   
	//json 오브젝트 타입
	let data={
			"keyword":keyword
	}
	
	console.log("getList-> keyword:"+keyword);
	
   // 아작나써유..(피)씨다타써..
   $.ajax({
      url:"/lprod/listAjax",
      contentType:"application/json;charset=utf-8",
      data:JSON.stringify(data),
      type:"post",
      dataType:"json",
      success:function(result){
         // result : List<LpordVO>
         console.log(">>>>result : ", result);
         
         $("h1").html("상품분류 목록");
         $("#divForm").html("");
         
         let str = "";
         
         str += "<table border='1'>";
         str += "<thead>";
         str += "<tr>";
         str += "<th>아이디</th><th>코드</th><th>명</th>";
         str += "</tr>";
         str += "</thead>";
         str += "<tbody>";
         
         // 반복 시작 ////////
         // result : List<LpordVO>
         $.each(result,function(idx,LpordVO){
            str += "<tr>";
            str += "<td>" + LpordVO.lprodId + "</td>";
            str += "<td><a href='/lprod/detail?lprodGu=" + LpordVO.lprodGu + "'>" + LpordVO.lprodGu + "</a></td>";
            str += "<td>" + LpordVO.lprodNm + "</td>";
            str += "</tr>";
         });
         // 반복 끝 ////////
         
         str += "</tbody>";
         str += "</table>";
         
         $("#divForm").html(str);
         
         
         // 검색 영역 추가
         let searchStr = "";
         
         searchStr += "<div>";
         searchStr += "<form>";
         searchStr += "<input type='text' name='keyword' value='"+keyword+"' placeholder='검색어를 입력하세요' />";
         searchStr += "<button type='button' id='btnSearch'>검색</button>";
         searchStr += "</form>";
         searchStr += "</div>";
         
         //요소.prev() : 요소의 이전 요소 선택.
         $("#divForm").prev().remove();
         $("#divForm").before(searchStr);
      }
   });
}
</script>
</head>
<body>
   <h1>상품분류 상세</h1>
   <!-- 
   요청URI : /lprod/updatePost
   요청파라미터 : {lprodId=14,lprodGu=P501, lprodNm=분식류}
   요청방식 : post
 -->
    <div id="divForm">
      <form id="frm" action="/lprod/updatePost" method="post">
         <p>
            <input type="number" name="lprodId" value="${lprodVO.lprodId}"
               readonly class="formdata" placeholder="상품분류 아이디(ex. 14)" />
         </p>
         <p>
            <input type="text" name="lprodGu" value="${lprodVO.lprodGu}" readonly
               class="formdata" placeholder="상품분류 코드(ex. P501)" required />
         </p>
         <p>
            <input type="text" name="lprodNm" value="${lprodVO.lprodNm}" readonly
               class="formdata" placeholder="상품분류 명(ex. 분식류)" />
         </p>
   
         <!-- ///// 일반모드 시작 ///// -->
         <p id="p1">
            <input type="button" id="edit" value="수정" /> <input type="button"
               id="delete" value="삭제" /> <input type="button" id="list" value="목록" />
         </p>
         <!-- ///// 일반모드 끝 ///// -->
         <!-- ///// 수정모드 시작 ///// -->
         <p id="p2" style="display: none">
            <input type="button" id="confirm" value="확인" /> <input type="button"
               id="cancel" value="취소" />
         </p>
         <!-- ///// 수정모드 끝 ///// -->
      </form>
   </div>
</body>
</html>