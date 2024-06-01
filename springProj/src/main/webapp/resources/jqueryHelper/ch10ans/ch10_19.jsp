<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* off() 메서드
	- on() 메서드로 연결된 이벤트 처리기를 제거하는데 자주 사용됨
	- 특정 이벤트 처리기를 제거하려면 선택기 문자열이 이벤트 처리기가 연결될 때
		on() 메서드에 전달된 문자열과 일치해야 가능함
	- $(selector).off(event, childSelector, data, function, map)
	*/
	$(function(){
		//버튼을 클릭하지 않은 상태에서 <p> 태그 내용을 마우스로 클릭하면
		//배경 색상이 핑크색으로 변함
	    $("p").on("click", function(){
	        $(this).css("background-color", "pink");
	    });
		//버튼을 클릭한 후에는 on() 메서드의 기능을 제거함
		//<p> 태그의 내용을 클릭해도 on() 메서드의 기능이 적용되지 않음
	    $("button").click(function(){
	        $("p").off("click");
	    });
	});
</script>
</head>
<body>
	<p>Click this paragraph to change its background color.</p>
	<button>Remove the click event handler</button>
</body>

</html>
