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
			- selector : h2 요소
			- filter : p 요소
			h2 요소를 selector로 하고 이전 모든 요소들 중에서 p 요소를 선택함
			*/
			$("h2").prevAll("p").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<div style="width:500px;" class="siblings">
		<p>p In this example</p>
		<span>span In this example</span>
		<h2>h2 In this example</h2>
		<h3>h3 In this example</h3>
		<p>p In this example</p>
		<p class="first">p class "first"</p>
		<p>p In this example</p>
		<span class="second">span class "second"</span>
		<span class="second">span also class "second"</span>
		<span>span</span>
		<h3 class="third">h3 class "third"</h3>
	</div>
	<button>실행</button>
<p>In this example</p>
</body>
</html>
