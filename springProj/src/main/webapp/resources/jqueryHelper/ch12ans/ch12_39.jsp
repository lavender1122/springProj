<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//removeAttr() : 선택한 요소에서 하나 이상의 특성을 제거함
	        $("p").removeAttr("style");
	    });
	});
</script>
</head>
<body>
	<h1>This is a heading</h1>
	<p style="font-size:120%;color:red">This is a paragraph.</p>
	<p style="font-weight:bold;color:blue">This is another paragraph.</p>
	<button>Remove the style attribute</button>





</body>
</html>
