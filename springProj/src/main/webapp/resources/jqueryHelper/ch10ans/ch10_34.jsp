<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* event.target : 이벤트를 자동 생성한 DOM 요소를 반환함
	
	*/
	$(function(){
		//<p>, <button>, <h1> 요소에는 click 이벤트가 정의됨
		//각 요소를 클릭하여 이벤트를 자동 실행한 요소를 표시함
	    $("p, button, h1").click(function(event){
	        $("div").html("Triggered by a " 
	        		+ event.target.nodeName + " element.");
	    });
	});
</script>
</head>
<body>
	<h1>This is a heading</h1>
	<p>This is a paragraph</p>
	<button>This is a button</button>
	<div style="color:blue;"></div>

</body>
</html>
