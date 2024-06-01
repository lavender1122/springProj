<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* mouseenter(), mouseleave 이벤트
	1. mouseenter() 메서드 : 마우스 포인터가 HTML 요소에 들어가면 실행됨
	2. mouseleave() 메서드 : 마우스 포인터가 HTML 요소를 벗어날 때 실행됨
	*/
	$(function(){
		//<p> 태그 위로 마우스가 들어가면 배경이 노란색이 됨
	    $("p").mouseenter(function(){
	        $("p").css("background-color", "yellow");
	    });
	    //<p> 태그 요소를 벗어나면 배경색이 밝은 회색으로 바뀜
	    $("p").mouseleave(function(){
	        $("p").css("background-color", "lightgray");
	    });
	});
</script>
</head>
<body>
	<p id="p1">This is a paragraph.</p>
</body>

</html>
