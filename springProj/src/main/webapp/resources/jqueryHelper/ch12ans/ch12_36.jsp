<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//removeClass() 메서드 : 선택된 요소에서 하나 이상의
	    	//		클래스 이름을 제거함
	    	//	classname을 지정하지 않으면, 선택된 요소에서
	    	//		모든 클래스 이름을 제거함
	        $("p:last").removeClass("intro").addClass("main");
	    });
	});
</script>
<style>
	.intro { color: red; }
	.main {  background-color: yellow; 	}
</style>
</head>
<body>
	<h1>This is a heading</h1>
	<p>This is another paragraph.</p>
	<p class="intro">This is a paragraph.</p>
	<button>Change class name of the last p element</button>




</body>
</html>
