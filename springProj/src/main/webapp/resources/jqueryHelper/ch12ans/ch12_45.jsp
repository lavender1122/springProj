<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//replaceWith() 메서드는 선택한 요소를 새 내용으로 바꿈
	$(function(){
	    $("button").click(function(){
	    	//replaceAll() 의 일반 형식에서 selector와 content의
	    	//	위치가 바뀜
	    	//	content 매개변수는 가능한 값으로 HTML요소, jQuery 객체,
			//	DOM 요소가 옴
	        $("p").replaceWith("<h2>Hello world!</h2>");
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
