<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	- a 태그나 submit 태그는 누르게 되면 href 를 통해 이동하거나 , 
		창이 새로고침하여 실행됨
	- preventDefault 를 통해 이러한 동작을 막아줄 수 있음.
	- 주로 사용되는 경우는
		1) a 태그를 눌렀을때도 href 링크로 이동하지 않게 할 경우
		2) form 안에 submit 역할을 하는 버튼을 눌렀어도
			새로 실행하지 않게 하고싶을 경우 (submit은 작동됨)
	*/
	$(function(){
		$("a").click(function(event){
        	event.preventDefault();
		    $("p").text("preventDefault() was called: " 
		    		+ event.isDefaultPrevented());
	    });
	});
</script>
</head>
<body>
	<a href="https://www.naver.com/">Go to naver.com</a>
	<p></p>

</body>
</html>
