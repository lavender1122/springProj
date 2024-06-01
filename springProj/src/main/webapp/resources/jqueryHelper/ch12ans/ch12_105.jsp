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
			- selector : h2 태그 요소
			- stop : h3 태그 요소
			- filter : first, second, third class 요소들
			- selector와 stop 요소는 포함되지 않음
			*/
			$("h2").prevUntil("h3", ".first, .second, .third")
			.css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body>
	<div style="width:500px;" class="siblings">
		<p>p In this example</p>
		<h3>h3 In this example</h3>
		<p class="first">p class "first"</p>
		<p>p In this example</p>
		<span class="second">span class "second"</span>
		<span class="second">span also class "second"</span>
		<span>span</span>
		<h2 class="third">h2 class "third"</h2>
	</div>
	<button>실행</button>
<p>In this example</p>
</body>
</html>
