<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* last 관련 선택자 > 1. :last 선택자
	:last와 :last-child 그리고 :last-of-type 선택자가 있음
	
	:last 선택자는 마지막 요소를 선택함
	하나의 요소만 선택
	대부분, 다른 선택자와 함께 그룹의 마지막 요소를 선택하는 데 사용됨
	*/
	$(function(){
	    $("button").click(function(){
	    	//<p> 태그 중에서 맨 마지막에 위치한 요소를 선택함
       		$("p:last").css("background-color", "yellow");
	    });
	});
</script>
</head>
<body>
	<div>
		<img src="/images/ch09_15_01.jpg" />
	</div>
	<h2>This is a heading</h2>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Click me</button>
</body>
</html>
