<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//스타일 속성을 이용하여 배경 색상을 지정하여 출력
	        console.log("Background color = " 
	        		+ $("p").css("background-color"));
	    });
	});
</script>
</head>
<body>
	<h2>This is a heading</h2>
	<p style="background-color:#ff0000">This is a paragraph.</p>
	<p style="background-color:#00ff00">This is a paragraph.</p>
	<p style="background-color:#0000ff">This is a paragraph.</p>
	<button>Return background-color of p</button>
</body>
</html>
