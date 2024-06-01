<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
    $("button").click(function(){
    	//abcde.txt 파일 안에 id="p1"인 요소의 내용을 특정 div 요소로 로드함
        $("#div1").load("/upload/abcde.txt");
    });
});
</script>
</head>
<body>
	<div id="div1"></div>
	<button>Send an HTTP POST request to a page and get the result back</button>
</body>
</html>
