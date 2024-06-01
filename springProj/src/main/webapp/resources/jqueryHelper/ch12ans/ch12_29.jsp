<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//요소의 클래스 이름을 변경하기 위해서는 
	    	//먼저 removeClass()를 사용하여 해당 클래스 이름을 제거하고,
	    	//addClass()를 사용하여 새 클래스 이름을 추가함
	    	//<p>의 마지막 요소의 intro 클래스를 제거하고, 새롭게 main 클래스를 적용함
	        $("p:last").removeClass("intro").addClass("main");
	    });
	});
</script>
<style>
	.intro {
	    color: red;
	}
	.main {
	    background-color: yellow;
	}
</style>
</head>
<body>
	<h1>This is a heading</h1>
	<p>This is another paragraph.</p>
	<p class="intro">This is a paragraph.</p>
	<button>Change class name of the last p element</button>


</body>
</html>
