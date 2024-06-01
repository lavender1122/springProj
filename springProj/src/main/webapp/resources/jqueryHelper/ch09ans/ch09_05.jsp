<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* 그룹 선택자
	jQuery 태그 선택자는 여러 종류의 태그를 선택할 경우에 콤마(,)에 의해
	구분하여 선택할 수 있음
	*/
	$(function(){
	    $("button").click(function(){
	    	//$("태그1,태그2,태그3..").실행_함수()
	    	//선택된 요소는 하나의 문서 내에 여러 개의 요소가 존재할 수 있음
	    	//이들 요소 중에서 선택자에 지정된 요소를 선택할 수 있음
	    	//해당 태그 요소를 선택하여 속성을 바꾸어줌
   			$("h2, div, span").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h1>Welcome to My Web Page</h1>
	<h2>Nice to meet you</h2>
	<div>Very nice indeed.</div>
	<p>How are you?</p>
	<p>I'm fine, <span>thanks.</span></p>
	<button>Click me</button>
</body>
</html>
