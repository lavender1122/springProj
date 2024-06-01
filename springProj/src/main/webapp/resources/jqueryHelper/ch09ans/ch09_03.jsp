<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/*
	#id 선택자는 HTML 태그의 id 속성을 사용하여 특정 요소를 찾음
	id는 페이지 내에서 고유해야 하므로 단일 고유 요소를 찾으려는 경우
	#id 선택자를 사용하는데 편리함.
	만약 여러 개의 id가 존재한다면 최초의 해당 id에만 적용 됨
	*/
	$(function(){
	    $("button").click(function(){
	    	//$("#id이름").실행_함수();
	    	//버튼 클릭 시 id="test"인 요소를 찾아 숨김
       		$("#test").hide();
	    });
	});
</script>
</head>
<body>
	<h2>This is a heading</h2>
	<p>This is a paragraph.</p>
	<p id="test">This is another paragraph.</p>
	<button>Click me</button>
</body>
</html>
