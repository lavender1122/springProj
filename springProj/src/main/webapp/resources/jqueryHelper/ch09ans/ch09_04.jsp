<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> -->
<script src="/js/jquery.min.js">
</head>
<body>
<script>
	/* .class 선택자
	jQuery의 .class 선택자는 특정 클래스가 있는 요소를 찾음.
	*/
	$(function(){
	    $("button").click(function(){
	    	//$(".class이름").실행_함수();
	    	// class="test"인 요소를 선택함
	    	//하나의 문서 내에는 여러 개의 class가 존재할 수 있으며,
	    	//id 선택자의 경우와는 달리 해당 class 모두가 적용 됨
	        $(".test").hide();
	    });
	});
</script>
	<h2 class="test">This is a heading</h2>
	<!-- <p> 태그에 class="test"를 부여하였다면
		class="test"로 정의된 모든 요소가 숨겨짐
	 -->
	<p class="test">This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Click me</button>
</body>
</html>
