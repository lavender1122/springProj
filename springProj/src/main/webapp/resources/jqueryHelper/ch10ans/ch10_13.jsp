<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* resize 메서드
	브라우저 창의 크기를 변경할 때 발생함
	*/
	var i=0;
	
	$(function(){
		//윈도우의 크기가 변경되면
	    $(window).resize(function(){
	    	//브라우저 내용의 너비를 출력 함
	        $("span").text(window.innerWidth);
	    });
	});
</script>
</head>
<body>
	Enter your name: <input type="text" />
	<p>Keypresses: <span>0</span></p>
</body>

</html>
