<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
</head>
<body>
<script>
	$(function(){
	    $("button").click(function(){
	    	//각 태그에 부여된 id나 class 등으로 지정된
	    	//태그에 대해서도 콤마(,)에 의해 구분된
	    	//여러 선택자를 사용할 수 있음
	    	//$(".요소 이름A, 요소 이름B,...").실행_함수();
	    	//class="test"로 정의된 모든 요소와
	    	//id="demo"로 정의된 요소를 선택하여 숨김
	        $(".test, #demo").hide();
	    });
	});
</script>
	<h2 class="test">This is a heading</h2>
	<p id="demo">This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Click me</button>
</body>
</html>
