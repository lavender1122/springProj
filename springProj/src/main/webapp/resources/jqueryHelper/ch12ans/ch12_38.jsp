<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//선택한 요소에서 여러 클래스 이름을 제거
	    	//<p>, <h1> 태그에 대해 클래스 head, intro, main
	    	//	인 요소의 스타일을 제거함
	        $("p, h1").removeClass("head intro main");
	    });
	});
</script>
<style>
	.head { font-size: 2em;
	        color: green; }
	.intro { font-size: 120%;
		    color: red;  }
	.main { font-size: 20px;
		    color: blue; }
</style>
</head>
<body>
	<h1 class="head">This is a heading</h1>
	<p class="intro">This is a paragraph.</p>
	<p class="main">This is another paragraph.</p>
    <button>Remove many elements</button>





</body>
</html>
