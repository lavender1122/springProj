<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	- 3가지 가장 기본적인 필터링 방법은 first(), last() 및 eq()
	- 이 필터를 사용하면 요소 그룹에서 위치를 기반으로 특정 요소를 선택할 수 있음
	- filter()와 not()와 같은 다른 필터링 방법을 사용하면
		특정 기준과 일치하거나 일치하지 않는 요소를 선택할 수 있음
	- first() : 선택한 요소의 첫 번재 요소를 반환
	- last() : 선택한 요소의 마지막 요소를 반환
	- eq() : 선택된 요소의 특정 인덱스 번호를 가진 요소를 반환
	- filter() : 조건을 지정할 수 있음. 기준과 일치하지 않는 요소는
		선택 항목에서 제거되고, 일치하는 요소는 반환함
	- not() : 조건과 일치하지 않는 모든 요소를 반환함
	*/
	$(function(){
		$("button").click(function(){
			//first() : 선택한 요소의 첫 번째 요소를 반환
			//첫번째 p 요소 선택
			$("p").first().css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h1>Welcome to My Homepage</h1>
	<p>My name is Donald (index 0).</p>
	<p>Donald Duck (index 1).</p>
	<p>I live in Duckburg (index 2).</p>
	<p>My best friend is Mickey (index 3).</p>
	<button>실행</button>
</body>
</html>
