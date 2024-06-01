<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* slice() 메서드
	- 해당 인덱스를 기반으로 요소의 하위 집합을 선택함
	- 부분 집합은 더 큰 집합의 일부인 집합임
	- 그룹의 요소 선택을 시작점과 끝점으로 제한하는데 사용됨
	- 시작 매개변수는 하위 집합을 만들 수 있는 시작 색인(0부터 시작)
	- 중지 매개변수는 선택적 끝 점
	- 달러(selector).slice(start, stop);
	- start : 필수 항목, 요소 선택을 시작할 위치를 지정
	- stop  : 선택 항목, 요소 선택을 종료할 위치를 지정
	- start와 stop의 값으로 음수를 사용하면 처음 요소가 아닌 끝에서부터
			요소를 선택함
	*/
	$(function(){
		$("button").click(function(){
	    	$("p").slice(-3, -1)
	    	.css("background-color", "yellow");
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
	<p>And I'm in love with Daisy (index 4).</p>
	<div>select the p elements with index number 2 and 3.</div>
	<button>실행</button>
</body>
</html>
