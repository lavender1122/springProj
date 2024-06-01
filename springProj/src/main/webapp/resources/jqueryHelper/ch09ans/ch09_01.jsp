<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	//jQuery 선택자는 jQuery 라이브러리에서 가장 중요한 부분 중 하나임
	//jQuery 선택자를 사용하면 HTML DOM 구조를 탐색하여 HTML 요소를
	//선택하고 조작할 수 있음.
	/*
	문서 객체 모델(DOM, Document Object Model)
	 - XML이나 HTML 문서에 접근하기 위한 일종의 인터페이스
	 - 문서 내의 모든 요소를 정의하고, 각각의 요소에 접근하는 방법을 제공함
	 - DOM은 W3C의 표준 객체 모델임
	 
	jQuery 기본 선택자는 이름, id, 클래스, 유형, 속성 등을 기반으로
	HTML 요소를 찾거나 선택하는 데 사용됨
	모든 선택자는 달러 기호"$"와 괄호"()"로 시작함
	*/
	$(function(){
	    $("button").click(function(){
	    	//jQuery 태그 이름 선택자는 요소(태그) 이름을
	    	//기반으로 요소를 선택함
	    	//$("태그 이름").실행_함수();
	    	//태그 <p>에 해당하는 요소를 선택하여 모두 숨김
       		$("p").hide();
	    });
	});
</script>
</head>
<body>
	<h2>HTML DOM(Document Object Model)</h2>
	<p>
		<img src="/images/htmlDom.png" />
	</p>
	<p>
		<img src="/images/ch09_01_01.jpg" />
	</p>
	<h2>This is a heading</h2>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Click me</button>
</body>
</html>
