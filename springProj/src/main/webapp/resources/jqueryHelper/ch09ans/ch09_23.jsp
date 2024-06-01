<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* 9.2 속성 선택자
	지금까지는 태그 요소를 기반으로 선택하여 해당 요소에 대한 action을 수행함
	속성을 기반으로 해당 요소를 선택함
	속성을 이용한 선택자는 대괄호([])에 의해 표현됨
	*/
	$(function(){
		$("#id").click(function(){
			//태그의 종류나 id 속성 값과는 상관없이 id 속성을 가진 모든 요소를 선택
	        $("[id]").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h2>속성 값에 의한 선택자</h2>
	<div>
		<img src="/images/ch09_23_01.jpg" />
	</div>
	<p>I live in Italy.</p>
	<p lang="it">Ciao bella!</p>
    <ul id="choose">
		<li>Goofy</li>
		<li>Mickey</li>
		<li>Pluto</li>
	</ul>
	<button id="id">select with id</button>
</body>
</html>
