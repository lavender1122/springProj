<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* [attribute$=value] 선택자
	속성의 값이 주어진 값으로 끝나는 요소를 찾음
	*/
	$(function(){
		$("#yellow").click(function(){
			//<a> 태그의 href 속성 값이 ".org"로 끝나는 요소를 선택
	        $("a[href$='.org']").css("background-color", "yellow");  });
	});
</script>
</head>
<body>
	<p title="Tomorrow" name="nationality">This is a paragraph.</p>
	<p title="tomorrow" name="nation" value="English">This is a paragraph.</p>
	<p title="Tom">This is a paragraph with wikipedia.org</p>
	<p title="See You Tomorrow">This is a paragraph.</p>
	<p title="Tomorrow-the day after today">This is a paragraph.</p>
	<a href="http://www.google.com">Google.com</a><br>
	<a href="http://www.wikipedia.org">wikipedia.org</a><br />
	<button id="yellow">yellow</button>
</body>
</html>
