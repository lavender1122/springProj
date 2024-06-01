<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* :last-child 선택자
		부모 태그를 기준으로 자식 요소 중에서 마지막 해당 태그의 요소를 선택함
	*/
	$(function(){
	    $("button").click(function(){
	    	//부모 태그<body>를 기준으로 자식 요소 중에서 
	    	//마지막 해당 태그<p>의 요소를 선택함
       		$("p:last-child").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<p>This is oth paragraph.</p>
	<p>This is first paragraph.</p>
    <p>This is second paragraph.</p>
    <p>This is third paragraph.</p>
	<button>Click me</button>
	<p>This is third paragraph.</p>
</body>
</html>
