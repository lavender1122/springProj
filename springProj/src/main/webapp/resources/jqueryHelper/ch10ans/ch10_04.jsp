<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* mouseover, mouseout 이벤트
	 - 해당 요소 안에서 마우스를 움직이면 발생
	 - mouseenter / mouseleave 이벤트와 매우 유사하게 작용
	 - mouseenter / mouseleave 메서드는 해당 요소 안으로 들어왔거나 나갈 때
	 	1번 발생함
	1. mouseover 이벤트 : 마우스 포인터가 선택한 요소 위에 있을 때 발생
	2. mouseout / mouseleave 이벤트 : 마우스 포인터가 선택한 요소를 벗어날 때 발생
	*/
	$(function(){
	    $("p").mouseover(function(){
	    	//<p> 태그 위에 마우스를 올리면 배경색이 노란색으로 바뀜
	        $("p").css("background-color", "yellow");
	    	console.log("mouseover");
	    });
	    $("p").mouseout(function(){
	    	//<p> 태그 요소를 벗어나면 배경색이 밝은 회색으로 바뀜
	        $("p").css("background-color", "lightgray");
	        console.log("mouseout");
	    });
	});
</script>
</head>
<body>
	<p>test of mouseover and mouseout event.</p>
</body>
</html>
