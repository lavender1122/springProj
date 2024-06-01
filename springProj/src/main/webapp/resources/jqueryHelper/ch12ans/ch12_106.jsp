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
			- selector : li 요소의 start class
			- stop : li 요소의 stop class
			- filster : first class
			li 요소 중에서 start class 이전부터 li 요소 중에서 stop class
			다음 까지의 요소들 중에서 first class 요소만 선택
			selector와 stop 요소는 포함되지 않음
			*/
	    	var DOM = document.getElementsByClassName("li.stop");
		    $("li.start").prevUntil(DOM,".first")
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
