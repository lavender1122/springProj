<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* :odd 선택자
	홀수 인덱스(예 : '1','3','5'...)를 가진 각 요소를 선택함
	인덱스 번호는 '0'에서 시작
	대부분 다른 선택자와 함께 그룹의 모든 홀수 색인 요소를 선택하는데 사용됨
	*/
	$(function(){
	    $("button").click(function(){
	    	//<p> 태그 중에서 홀수 번째 요소를 선택
       		$("p:odd").css("background-color", "yellow");
	    });
	});
</script>
</head>
<body>
	<h2>This is a heading</h2>
	<p>This is oth paragraph.[0]</p>
	<p>This is first paragraph.[1]</p>
    <p>This is second paragraph.[2]</p>
    <p>This is third paragraph.[3]</p>
	<button>Click me</button>
</body>
</html>
