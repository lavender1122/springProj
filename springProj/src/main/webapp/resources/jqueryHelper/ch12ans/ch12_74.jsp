<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<style>
.descendants * { 
    display: block;
    border: 2px solid orange;
    color: blue;
    padding: 5px;
    margin: 15px;
}
</style>
<script src="/js/jquery.min.js"></script>
<script>
/* JQuery 를 이용한 테이블 컬럼값 변경 하기
$("#id table tr:eq(0) td:eq(0)").html("000");
$("#id table tr:eq(1) td:eq(1)").html("111");
$("#id table td:eq(2)").html("222");

//코드명, 설명 변경하는 방법
let trArr = $("#detTbody").children("tr");

for(let i=0;i<trArr.length;i++){
	//tr을 반복하면서 코드값을 str1변수에 저장
	let str1 = $("#detTbody tr:eq("+i+") td:eq(1)").html();
	console.log("i : " + i + ", str1 : " + str1);
	//str1변수와 클릭 시 가져온 코드값이 같으면 코드명, 설명을 변경함
	if(str1==comDetCode){
		$("#detTbody tr:eq("+i+") td:eq(2)").html(comDetCodeNm);
		$("#detTbody tr:eq("+i+") td:eq(3)").children("span").eq(0).html(descriptions);
	}//end if
}//end for
//모달창을 닫음
$("#defaultModal").modal("hide");
*/
	$(function(){
		$("button").click(function(){
			//<div> 요소의 모든 직접 자식을 반환
			//<p> 요소만의 속성이 바뀜
			
    		$("div").children()
    		.css({"color": "green", "border": "2px solid green"});
		});
	});
</script>
</head>
<body>
	<div class="descendants" style="width:500px;">div (current element)
		<p>p (child)
	    	<span>span (grandchild)</span>
		</p>
		<p>p (child)
			<span>span (grandchild)</span>
		</p>
	</div>
	<button>Add classes to elements</button>
</body>
</html>
