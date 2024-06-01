<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	$(function(){
    	$("button").click(function(){
    		//모든 <ul> 요소의 첫 번째 <li> 요소를 선택
        	$("ul li:first-child").hide();
	    });
	});
</script>
</head>
<body>
	<h2>jQuery 선택자 결합 활용</h2>
	<p>
		<img src="/images/ch09_48_01.jpg" />
	</p>
	<p>List 1:</p>
	<ul>
	  <li>Coffee</li>
	  <li>Milk</li>
	  <li>Tea</li>
	</ul>
	<p>List 2:</p>
	<ul>
	  <li>Coffee</li>
	  <li>Milk</li>
	  <li>Tea</li>
	</ul>
<button>Click me</button>
</body>
</html>
