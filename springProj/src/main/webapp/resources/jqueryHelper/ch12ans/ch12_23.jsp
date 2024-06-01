<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("#btn1").click(function(){
	    	//선택한 HTML 요소 이후에 내용을 삽입
	        $("img").before("<b>Before</b>");
	    });
	    $("#btn2").click(function(){
	    	//선택한 HTML 요소 앞에 내용을 삽입
	        $("img").after("<i>After</i>");
	    });
	});
</script>
</head>
<body>
	<img src="/images/yacht.jpg" alt="jQuery" 
		width="300" height="140" /><br /><br />
	<button id="btn1">Insert before</button>
	<button id="btn2">Insert after</button>
</body>
</html>
