<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	// :selected : 미리 선택된 옵션 요소를 선택. 
	// 선택자는 확인란이나 라디오 버튼에서 작동하지 않음.(:checked 선택자 사용하기)
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
	/*
	let trArr = $("#detTbody tr");
     console.log("trArr : ",trArr);
     
     $.each(trArr,function(i,tr){
        console.log(i,"=",tr);
        let str1 = $(tr).children("td:eq(1)").text();
        
        if(comDetCode==str1){
           $(tr).remove();
        }
     });
	*/
	$(function(){
		// :selected 선택자를 적용함
		//4개의 항목 중에서 임의의 항목을 선택하기 위해 화살표(V)를 선택하면
		//<option> 태그의 selected 속성이 "selected"로 지정된 항목이
		//빨간색으로 설정되어있음
		$(":selected").css("background-color", "red");  
		
		$("#sel").on("change",function(){
			$(":selected").css("background-color", "blue");
			
			console.log($(this).val());
			console.log($(this).children("option:selected").text());
			
			// select box ID로 접근하여 선택된 값 읽기
			$("#sel option:selected").val();

			// select box Name로 접근하여 선택된 값 읽기
			$("select[name='sel']").val();

			// 같은 방식으로 span과 같은 다른 태그도 접근 가능하다~
// 			$("span[name=셀렉트박스name]").text();

			// 선택된 값의 index를 불러오기
			var index = $("#sel option").index($("#sel option:selected"));

			// 셀렉트 박스에 option값 추가하기
			$("#sel").append("<option value='1'>1번</option>");

			// 셀렉트 박스 option의 맨앞에 추가 할 경우
			$("#sel").prepend("<option value='0'>0번</option>");

			// 셀렉트 박스의 html 전체를 변경할 경우
			$("#sel").html("<option value='1'>1차</option><option value='2'>2차</option>");

			// 셀렉트 박스의 index별로 replace를 할 경우
			// 해당 객체를 가져오게 되면, option이 다수가 되므로 배열 객체가 되어 eq에 index를 넣어 개별 개체를 선택할 수 있다.
			$("#sel option:eq(1)").replaceWith("<option value='1'>1차</option>");

			// 직접 index 값을 주어 selected 속성 주기
			$("#sel option:eq(1)").attr("selected", "selected");

			// text 값으로 selected 속성 주기
			$("#sel").val("1번").attr("selected", "selected");

// 			or

			$("#id").text("1번").attr("selected", "selected");

			// value 값으로 selected 속성 주기
			$("#sel").val("1");

// 			or

			$("#id").val("1").prop("selected", true);

			// 해당 index item 삭제하기
// 			$("#sel option:eq(0)").remove();

			// 첫번째, 마지막 item 삭제하기
// 			$("#sel option:first").remove();
// 			$("#sel option:last").remove();

			// 선택된 옵션의 text, value 구하기
			$("#sel option:selected").text();
			$("#sel option:selected").val();

			// 선택된 옵션의 index 구하기
			$("#sel option").index($("#sel option:selected"));

			// 셀렉트박스의 아이템 갯수 구하기
			$("#sel option").size();

			// 선택된 옵션 전까지의 item 갯수 구하기
			$("#sel option:selected").prevAll().size();

			// 선택된 옵션 후의 item 갯수 구하기
			$("#sel option:selected").nextAll().size();

			// 해당 index item 이후에 option item 추가 하기
			$("#sel option:eq(0)").after("<option value='3'>3번</option>");

			// 해당 index item 전에 option item 추가하기
			$("#sel option:eq(3)").before("<option value='2'>2번</option>");
		});
		
	});
</script>
</head>
<body>
	<h2>기타 연산자</h2>
	<p>
		<img src="/images/ch09_37_01.jpg" />
	</p>
	<form action="">
		Name: <input type="text" name="user"><br>
		Car: <select id="sel" name="sel">
				<option>Volvo</option>
				<option selected="selected">Saab</option>
				<option>Mercedes</option>
				<option>Audi</option>
			</select>
	</form>

</body>
</html>
