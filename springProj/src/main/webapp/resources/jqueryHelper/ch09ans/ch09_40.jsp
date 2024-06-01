<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	$(function(){
		$("#header").click(function(){
			// :header 선택자 => 모든 헤더 요소<h1>에서 <h6>를 선택
			$(":header").css("background-color","yellow");
		});
	});
</script>
</head>
<body>
	<h1>기타 연산자</h1>
	<p>
		<img src="/images/ch09_40_01.jpg" />
	</p>
	<h2>Have a Good_time...</h2>
    <h4>It's vary Good...</h4>
    <h6>Have a Good_time...</h6>
	<p class="intro">My name is Donald.</p>
	<p>I live in Duckburg.</p>
	<p>My best friend is Mickey.</p>
	<p>Who is your favourite:</p>
	<ul id="choose">
    	<li>Kia</li>
		<li>BMW</li>
	</ul>
	<button id="header">header</button>
</body>
</html>
