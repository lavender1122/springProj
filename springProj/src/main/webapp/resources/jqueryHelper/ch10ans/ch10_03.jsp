<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* mousedown(), mouseup() 이벤트
	1. mousedown() 메서드 : 마우스가 HTML 요소 위에 있을 때 마우스 버튼을 누른 상태에서
		함수가 실행 됨
	2. mouseup() 메서드 : 마우스 버튼을 놓았을 때 함수가 실행 됨
	*/
	$(function(){
	    $("#p1").mousedown(function(){
    	    alert("Mouse down over p1!");
	    });
		$("#p2").mouseup(function(){
    	    alert("Mouse up over p2!");
	    });
	});
</script>
</head>
<body>
	<p id="p1">This is a paragraph.</p>
   	<p id="p2">This is a paragraph.</p>
</body>

</html>
