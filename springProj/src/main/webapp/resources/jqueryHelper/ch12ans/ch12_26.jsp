<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//지정된 요소에 2개의 클래스 이름을 추가
	    	//<p>의 첫 번째 요소에 2개의 클래스(intro, note)를 추가
	        $("p:first").addClass("intro note");
	    });
	});
</script>
<style>
	.intro {
	    font-size: 30px;
	    color: blue;
	}	
	.note {
	    background-color: yellow;
	}
</style>
</head>
<body>
	<h1>This is a heading</h1>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Add two class names to the first p element</button>


</body>
</html>
