<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//hasClass() 메서드 : 선택한 요소에 지정된 클래스 이름이 있는지 확인
	$(function(){
	    $("button").click(function(){
	    	//<p> 요소에 intro라는 클래스가 있는지 확인함
// 	        console.log($("ANY").hasClass("intro"));
	        console.log($("p").hasClass("intro"));
	    });
	});
</script>
<style>
	.intro { font-size: 120%;
		    color: red;  }
</style>
</head>
<body>
	<h1>This is a heading</h1>
	<p class="intro">This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>hasClass?</button>
</body>
</html>
