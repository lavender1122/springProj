<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* 전체 선택자
	"*" 선택자는 HTML, head 및 body를 포함하여 문서의 모든 요소를 선택함
	"*" 선택자가 다른 요소와 함께 사용되면 지정된 요소 내의 모든 하위 요소를 선택함
	*/
	$(function(){
	    $("button").click(function(){
	    	//"*"가 다른 선택자 <body>와 함께 사용됨
	    	//태그 <body>에 포함된 모든 요소를 선택함
		    $("body *").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h2>This is a heading</h2>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Click me</button>
</body>
</html>
