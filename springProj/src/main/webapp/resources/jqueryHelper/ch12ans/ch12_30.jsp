<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//여러 요소를 선택하여 클래스를 추가할 수 있음
	    	//<h1>, <h2>, <p> 태그에 대해 추가적으로 class="blue"가 적용됨
	        $("h1, h2, p").addClass("blue");
	    	//<div> 태그에 대해 추가적으로 class="important"가 적용됨
	        $("div").addClass("important");
	    });
	});
</script>
<style>
.important {
    font-weight: bold;
    font-size: xx-large;
}
.blue {
    color: blue;
}
</style>
</head>
<body>
	<h1>Heading 1</h1>
	<h2>Heading 2</h2>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<div>This is some important text!</div><br>
	<button>Add classes to elements</button>
</body>
</html>
