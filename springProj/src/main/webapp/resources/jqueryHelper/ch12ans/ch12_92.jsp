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
			//필터 매개변수를 사용하여 클래스 이름이 first, second, third인
			//<h2> 요소의 모든 형제를 가져옴
			$("h2").nextAll(".first,.second,.third")
			.css({"color": "red", "border": "2px solid green"});
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
