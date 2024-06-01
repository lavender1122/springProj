<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//switch 매개변수를 사용하여 클래스 이름만 추가하거나 제거하는 방법 제공
	$(function(){
	    $("#add").click(function(){
	    	//toggleclass() 메서드의 switch 속성 값이
	    	//	true로 적용하였으므로, 모든 <p> 요소에 main 스타일이 적용됨
	    	//toggleClass() 메서드의 switch 속성 값이
	    	//  false로 적용하였으므로, 모든 <p> 요소에 main 스타일이 제거됨
	        $("p").toggleClass("main",true);
	    });
	    $("#remove").click(function(){
	        $("p").toggleClass("main",false);
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
	<button id="add">Add class "main"</button>
	<button id="remove">Remove class "main"</button>





</body>
</html>
