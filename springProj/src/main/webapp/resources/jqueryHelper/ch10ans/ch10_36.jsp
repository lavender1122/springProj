<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	event.type 속성은 자동 실행된 이벤트 유형을 반환함
	*/
	$(function(){
		//버튼 태그에 대해 클릭, 더블 클릭, 
		//mouseover, mouseout 이벤트가 정의됨
	    $("button").on("click dblclick mouseover mouseout"
	    		,function(event){
	    	//<span> 요소에 이벤트 유형이 표시 됨
	        $("span").text("Event: " + event.type);
	    });
	});
</script>
</head>
<body>
	<p>The result of event.type : 
		<span style="color:orange"></span></p>
	<button> Test of event.type..</button>
</body>
</html>
