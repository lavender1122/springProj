<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
</script>
<script>
	// :contains() 선택자는 지정된 문자열을 포함하는 요소를 선택함
	// 문자열은 텍스트로 요소에 직접 포함되거나 자식 요소에 포함될 수 있음
	// 인수로는 문자열이 들어감
	// 텍스트는 대/소문자를 구분함
	$(function(){
		$("#header").click(function(){
			// 텍스트 요소에 "is" 값이 있는 요소를 선택함
			$("p:contains(is)").css("background-color", "red");
		});
	});
</script>
</head>
<body>
	<h1>기타 연산자</h1>
	<p>
		<img src="/images/ch09_40_01.jpg" />
	</p>
	<hr />
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
