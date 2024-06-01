<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* 인덱스에 의한 선택자
	인덱스 번호는 '0'에서 시작함
	*/
	$(function(){
		$("#eq").click(function(){
			//<p> 태그 중에서 인덱스가 '1'인 요소를 선택
			$("p:eq(1)").css("background-color","yellow");
		});
		$("#gt").click(function(){
			//<li> 중에서 인덱스가 '1'보다 큰 요소들을 선택
			$("li:gt(1)").css("background-color", "yellow");
		});
		$("#lt").click(function(){
			//<li> 중에서 인덱스가 '2'보다 작은 요소들을 선택
			$("li:lt(2)").css("background-color", "yellow");
		});
		$("#not").click(function(){
			//<p> 중에서 이름이 'intro'인 요소를 제외하고 모두 선택
			$("p:not(.intro)").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<div>
		<img src="/images/ch09_22_01.jpg" />
	</div>
	<h6>Welcome to My Homepage</h6>
	<p class="intro">My name is Donald.</p>
	<p>I live in Duckburg.[0]</p>
	<p>My best friend is Mickey.[1]</p>
	<p>Who is your favourite:[2]</p>
	<ul id="choose">
    	<li>Kia[0]</li>
		<li>BMW[1]</li>
		<li>Benz[2]</li>
		<li>Hyundae[3]</li>
	</ul>
	<button id="eq">eq</button>
    <button id="gt">gt</button>
    <button id="lt">lt</button>
    <button id="not">not</button>
</body>
</html>
