<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//모든 <p>태그의 background-color 속성과 그 값을 yellow로 지정
	        $("p").css("background-color", "yellow");
	    });
	});
</script>
</head>
<body>
	<h2>This is a heading</h2>
	<p style="background-color:#ff0000">The color of This paragraph is red.</p>
	<p style="background-color:#00ff00">The color of This paragraph is green.</p>
	<p style="background-color:#0000ff">The color of This paragraph is blue.</p>
	<p>The color of This paragraph is white.</p>
	<button>Set background-color of p</button>
</body>
</html>
