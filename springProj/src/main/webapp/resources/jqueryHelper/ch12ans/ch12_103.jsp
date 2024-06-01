<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<style>
.descendants * { 
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
		$("button").click(function(){
			/*
			- selector : li 요소 중에서 class가 start인 요소
			- filter : li 요소 중에서 class가 stop인 요소
			selector와 filter를 제외한 사이의 영역이 선택 됨
			*/
		    $("li.start").prevUntil("li.stop")
		    .css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body>
	<div style="width:500px;" class="siblings">
		<ul>ul (parent)  
			<li class="stop">li (the previous sibling of "stop")</li>
			<li class="first">li (the previous sibling of "start")</li>
			<li>li (sibling)</li>
			<li class="start">li (the next sibling of "start")</li>
			<li class="first">li (the next sibling of "start")</li>
            <li >li (sibling with class name )</li>
            <li class="second">li (the next sibling of "start")</li>
		</ul>
	</div>
	<button>실행</button>
</body>
</html>
