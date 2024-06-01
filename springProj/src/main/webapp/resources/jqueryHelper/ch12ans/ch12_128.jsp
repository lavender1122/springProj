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
			//음수를 사용하여 시작 부분이 아닌 끝에서부터 탐색하여
			//	선택자에 의해 지정된 요소를 선택함
			//마지막 3개의 p 요소를 선택하는 음수(-3)을 사용함
			//	인덱스 위치 2(끝에서 세 번재 요소)까지 p 요소가 선택됨
	    	$("p").slice(-3).css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h1>Welcome to My Homepage</h1>
	<p>[0] My name is Donald (index 0).</p>
	<p>[1] Donald Duck (index 1).</p>
	<p>[2] I live in Duckburg (index -3).</p>
	<p>[3] My best friend is Mickey (index -2).</p>
	<p>[4] And I'm in love with Daisy (index -1).</p>
	<div>We use a negative number (-3)</div>
	<button>실행</button>	
</body>
</html>
