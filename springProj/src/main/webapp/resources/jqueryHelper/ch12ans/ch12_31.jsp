<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $("button").click(function(){
	    	//<p> 태그의 첫 번재 요소를 복사하여 <body> 요소의 끝에 삽입함
	        $("body").append($("p:first").clone(true));
	    });
	});
</script>
</head>
<body>
	<p>Click this paragraph to increase text size.</p>
	<p>This is another paragraph.</p>
	<button>Copy the first p element</button>


</body>
</html>
