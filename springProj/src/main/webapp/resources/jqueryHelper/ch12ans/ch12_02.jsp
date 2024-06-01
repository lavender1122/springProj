<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* attr() 메서드
	- 속성 값을 가져오는데 사용됨
	*/
	$(function(){
    	$("button").click(function(){
    		//링크에서 href 속성의 값을 가져옴
	        console.log($("#naver").attr("href"));
	    });
	});
</script>
</head>
<body>
<p><a href="https://www.naver.com" id="naver">naver.com</a></p>
<button>Show href Value</button>
</body>
</body>
</html>
