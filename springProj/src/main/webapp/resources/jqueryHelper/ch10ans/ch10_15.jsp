<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<style>
	.intro {
	    font-size: 150%;
	    color: red;
	}
</style>
<script>
	/* on() 메서드
	- 선택한 요소에 대해 하나 이상의 이벤트 처리기를 연결함
	- $(selector).on(event,childSelector,data,function,map)
	- event : [필수 항목]. 선택한 요소에 연결할 하나 이상의 이벤트를 지정
		(여러 이벤트는 공백으로 구분)
	- data : [선택 사항]. 함수에 전달할 추가 데이터를 지정
	- function : [필수 항목]. 이벤트가 발생할 때 실행 함수를 지정
	- map : 선택한 요소에 첨부할 하나 이상의 이벤트를 포함하는
		이벤트 맵과 이벤트가 발생할 때 실행되는 함수를 지정
	*/
	$(function(){
		//<p> 요소에 여러 이벤트 처리기를 연결함
		//<p>에 마우스를 올리면 style이 적용되며,
		//마우스가 <p> 태그 밖으로 나오면 초기의 상태가 됨
    	$("p").on("mouseover mouseout", function(){    	
    		//toggleClass() 메서드는 해당 클래스를 토글함
    		//첫 번째 이벤트에 대해 toggle-on, 
    		//두 번째 이벤트에 대해 toggle-off
	        $(this).toggleClass("intro");
	    });
	});
</script>
</head>
<body>
	<p>Move the mouse pointer over this paragraph.</p>
</body>

</html>
