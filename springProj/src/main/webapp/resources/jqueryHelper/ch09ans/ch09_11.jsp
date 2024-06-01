<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* 순서 선택자 > 1.first 관련 선택자
		first 관련 선택자는 :first와 :first-child 그리고 :first-of-type 선택자가 있음
		
		:first 선택자는 첫 번째 요소를 선택함. 이 선택자는 하나의 요소만 선택할 수 있음
		이것은 대부분 다른 선택자와 함께 그룹의 첫 번째 요소를 선택하는 데 사용됨
	*/
	$(function(){
	    $("button").click(function(){
	    	//2개의 <p> 태그가 있음. <p> 중에서 첫 번째 요소에만 적용됨
       		$("p:first").css("background-color", "yellow");
	    });
	});
</script>
</head>
<body>
	<h2>first 관련 선택자</h2>
	<div>
		<img src="/images/ch09_11_01.jpg" />
	</div>
	<h2>This is a heading</h2>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Click me</button>
</body>
</html>
