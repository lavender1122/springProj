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
		//siblings() 메서드의 옵션 매개변수를 사용하여 형제 요소들 중에서 특정 
		//	요소만을 선정하여 그 속성 값을 바꿀 수 있음
		//태그 요소 <h2>와 형제 관계에 있는 모든 <p>의 속성을 바꿈
		$("button").click(function(){
	        $("h2").siblings("p")
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
