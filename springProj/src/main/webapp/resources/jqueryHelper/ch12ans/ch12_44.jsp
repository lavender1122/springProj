<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//모든 <p> 요소를 바꿈
	    	//태그를 포함하여 바꿀 내용을 지정한 후
	    	//	replaceAll() 메서드에 바꿀 태그 요소를 선택자로 지정함
	        $("<h2>Hello world!</h2>").replaceAll("p");
	    });
	});
</script>
</head>
<body>
	<button>Replace all</button><br>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<p>This is another paragraph.</p>





</body>
</html>
