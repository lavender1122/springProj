<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("#btn1").click(function(){
	    	//wrap() 메서드를 적용
	        $("p").wrap("<div></div>");
	    });
	    $("#btn2").click(function(){
	    	//선택된 요소의 부모 요소에 대한 스타일을 제거함
	        $("p").unwrap();
	    });
	});
</script>
<style>
	div{ background-color: yellow; }
</style>
</head>
<body>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button id="btn1">Wrap </button>
	<button id="btn2">Unwrap</button>





</body>
</html>
