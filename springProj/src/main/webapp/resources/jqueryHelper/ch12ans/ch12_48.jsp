<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//wrap() 메서드는 지정된 각 요소 주위에 지정된 HTML 요소를 래핑함
	$(function(){
	    $("button").click(function(){
	    	//<p> 태그에 대해 <div> 태그로 래핑(묶음)함
	        $("p").wrap("<div></div>");
	    });
	});
</script>
<style>
	div{background-color: yellow;}
</style>
</head>
<body>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Wrap a div </button>
</body>
</html>
