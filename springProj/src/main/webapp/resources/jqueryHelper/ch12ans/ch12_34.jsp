<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
    	$("button").click(function(){	
	        $("p").remove(".test, .demo");
	    });
	});
</script>
</head>
<body>
	<p>This is a paragraph.</p>
	<p class="test">This is p element with class="test".</p>
	<p class="test">This is p element with class="test".</p>
	<p class="demo">This is p element with class="demo".</p>
	<button>Remove all p elements with class="test" and class="demo"</button>
</body>
</html>
