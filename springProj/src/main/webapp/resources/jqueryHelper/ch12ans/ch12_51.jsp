<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//wrap()과 unwrap()을 이용한 토글 방식 제공
	$(function(){		
	    $("#btn1").click(function(){
	        $("p").wrap("<div></div>");
	    });
	    $("#btn2").click(function(){
	    	//unwrap() 메소드는 wrap()된 결과를 취소함
	        $("p").unwrap();
	    });
	});
</script>
<style>
	div{background-color: yellow;}
</style>
</head>
<body>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button id="btn1">Wrap</button>
	<button id="btn2">Unwrap</button>

</body>
</html>
