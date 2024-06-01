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
			//span 요소가 있는 p, h3 및 div 요소를 모두 선택
			//선택자를 여러 개 지정하고, has()의 매개변수를 하나 지정함
		    $("p, h3, div").has("span").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h1>Welcome to My Homepage</h1>
	<p>A p element with a <span>span</span> element inside of it.</p>
	<p>Another p element with a <span>span</span> element inside of it.</p>
	<p>A p element with no span inside.</p>
	<h3>A h3 element with a <span>span</span> element inside of it</h3>
	<div>A div element with a <span>span</span> element inside of it</div>
	<button>실행</button>
</body>
</html>
