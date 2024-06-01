<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//선택한 요소에서 하나 이상의 클래스 이름을 추가하거나 제거하는 것을 토글함
	//각 요소에서 지정된 클래스 이름을 검사하고, 누락된 경우 클래스 이름이
	//	추가되고 이미 설정된 경우 제거함
	//- switch 매개변수를 사용하여 클래스 이름만 제거하거나
	//		클래스 이름을 추가하도록 지정할 수 있음
	$(function(){
	    $("button").click(function(){
	    	//첫 번째 <p> 요소는 클래스가 적용된 상태가 아니므로 클래스를 적용하고,
	    	//두 번째 <p> 요소는 클래스가 적용된 상태이므로 클래스를 제거함
	        $("p").toggleClass("main");
	    });
	});
</script>
<style>
	.main { font-size: 120%;
		    color: red;  }
</style>
</head>
<body>
	<p>This is a paragraph.</p>
	<p class="main">This is another paragraph.</p>
	<button>Toggle class</button>





</body>
</html>
