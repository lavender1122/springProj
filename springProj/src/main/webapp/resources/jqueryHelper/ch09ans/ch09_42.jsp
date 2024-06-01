<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
</script>
<script>
	// :focus : 현재 포커스가 있는 요소(커서가 위치한 곳)를 선택
	$(function(){
		//<input> 태그에 포커스를 위치시킴
	    $("input").focus();
		//포커스가 위치한 곳(input 태그)을 선택
	    $(":focus").css("background-color", "red");
	});
</script>
</head>
<body>
	<h1>기타 연산자</h1>
	<p>
		<img src="/images/ch09_40_01.jpg" />
	</p>
	<hr />
	<h2> Select Focus...</h2>
	<input type="text" />
</body>
</html>
