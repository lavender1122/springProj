<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		$("button").click(function(){
			//각 <div> 요소의 다음 형제 <p> 요소를 선택
		    $("div").next("p").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h1>What will $("div").next("p") select?</h1>
	<div style="border:1px solid black;padding:10px;">
		This is a div element.
	</div>
	<p>This p element is the next sibling element of a div element.</p>
	<p>This is another p element.</p>
	<div style="border:1px solid black;padding:10px;">
		  <p>This is a p element inside a div element.</p>
	</div>
	<h2>This is a heading, and the next sibling element of a div element</h2>
	<p>This is a p element </p>
	<button>실행</button>
</body>
</html>
