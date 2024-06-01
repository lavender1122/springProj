<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* hover() 메서드
	- 마우스 포인터가 선택된 요소 위에 있을 때 실행되는 2가지 함수를 지정함
	- mouseenter() 및 mouseleaver() 메서드의 조합으로 모두 자동 실행 됨
	*/
	$(function(){
	    $("#p1").hover(function(){
    	    alert("Mouse down over p1!");
	    }, 
		function(){
    	    alert("Bye! You now leave p1!");
	    });
	});
</script>
</head>
<body>
	<p id="p1">This is a paragraph.</p>
</body>

</html>
