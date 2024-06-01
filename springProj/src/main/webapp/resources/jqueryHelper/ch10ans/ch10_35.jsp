<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	event.timeStamp 속성 : 이벤트가 자동 실행된 1970년 1월 1일 이후의
				밀리 초를 반환함
	*/
	$(function(){
	    $("button").click(function(event){
	        $("span").text(
	        		"milliseconds after January 1, 1970. : " 
	        		+ event.timeStamp);
	    });
	});
</script>
</head>
<body>
	<p><span style="color:red">unknown</span></p>
	<button>Click me</button>

</body>
</html>
