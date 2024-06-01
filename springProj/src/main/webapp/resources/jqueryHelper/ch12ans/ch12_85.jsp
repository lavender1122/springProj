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
		$("button").click(function(){
			//siblings() 메서드는 선택한 요소의 모든 형제 요소를 반환함
			//<h2>와 형제 관계에 있는 모든 요소들의 속성을 바꿈
    		    $("h2").siblings()
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
	<button>Add classes to elements</button>
</body>
</html>
