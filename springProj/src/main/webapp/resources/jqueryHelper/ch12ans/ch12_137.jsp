<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* has() 메소드
	- 하나 이상의 요소가 있고 지정된 선택자와 일치하는 모든 요소를 반환함
	- 내부에 여러 요소가 있는 요소를 선택하려면 쉼표를 사용함
	- 달러(selector).has(element)
	- element : 필수 항목. 요소와 일치시킬 선택자 표현식 또는 요소를 지정
	*/
	$(function(){
		$("button").click(function(){
			//하이퍼링크가 있는 span 요소를 반환
	    	$("p").has("a[href]").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h1>Welcome to My Homepage</h1>
	<p>My <span>name</span> is Donald.</p>
	<p><span><a href="https://www.w3schools.com">Duckburg</a></span>. Come visit me!</p>
	<p>My <span>best</span> friend is Mickey.</p>
	<button>실행</button>
</body>
</html>
