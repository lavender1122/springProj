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
			//div 요소를 selector로 하여 이전 요소를 선택(p요소로 필터링)
	    	$("div").prev("p").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h2>What will $("div").prev("p") select?</h2>
	<p>this p element will not be selected.</p>
	<h3>This is a heading, and the previous sibling element of a div element</h3>
	<div style="border:1px solid black;padding:10px;">This is a div element.</div>
	<p>This is another p element.</p>
	<p>This p element is the previous sibling element of a div element.</p>
	<div style="border:1px solid black;padding:10px;">
		<p>This is a p element inside a div element.</p>
	</div>
	<button>실행</button>
</body>
</html>
