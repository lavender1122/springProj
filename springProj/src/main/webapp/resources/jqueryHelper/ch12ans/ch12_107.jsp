<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<style>
.siblings * { 
    display: block;
    border: 2px solid orange;
    color: blue;
    padding: 5px;
    margin: 15px;
}
</style>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		$("#next").click(function(){
			//h2 요소는 포함되지 않은 이전 요소 선택(span)
	        $("h2").prev()
	        .css({"color": "green", "border": "2px solid green"});
		});	
		$("#nextAll").click(function(){
			//h2 요소는 포함되지 않은 이전 모든 요소들을 선택(span, p)
			$("h2").prevAll()
			.css({"color": "green", "border": "2px solid green"});
		});
		$("#nextUntil").click(function(){
			/*
			- h3 요소 이전부터 span 다음까지 선택
			- h3 요소 및 span 요소는 포함되지 않음
			- h2가 선택됨
			*/
			$("h3").prevUntil("span")
			.css({"color": "green", "border": "2px solid green"});
		});
	});
</script>
</head>
<body class="siblings">
	<div>div (parent)
		<p>p</p>
		<span>span</span>
		<h2>h2</h2>
		<h3>h3</h3>
		<p>p</p>
	</div>
	<button id="next">Ex of next() Method</button>
    <button id="nextAll">Ex of nextAll() Method</button>
    <button id="nextUntil">Ex of NextUntil() Method</button>
</body>
</html>
