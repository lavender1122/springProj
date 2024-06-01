<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	$(function(){
	    $("#last").click(function(){
	    	//부모 노드의 마지막 자식 노드 요소를 선택
	        $("p:last").css("background-color", "yellow"); 
	    });
		$("#last-child").click(function(){
			//부모 태그를 기준으로 자식 요소 중에서 마지막 해당하는 <p> 태그의 요소를 선택함
			//마지막이 <p> 태그여야 함
	        $("p:last-child").css("background-color", "yellow"); 
	    });
		$("#last-of-type").click(function(){
			//자식 요소 중에서 지정된 태그와 같은 마지막 요소를 선택함
			//<p> 태그 중에서 마지막을 선택함
	        $("p:last-of-type").css("background-color", "yellow"); 
	    });
	});
</script>
</head>
<body>
	<p>body의 첫번째 단락, div의 첫번째 자식.</p>
	<div style="border:1px solid;">
		<p>div의 첫번째 단락, div의 첫번째 자식.</p>
		<p>div의 마지막 단락, div의 마지막 자식.</p>
	</div><br>
	<div style="border:1px solid;">
		<span>span 요소, 이 div의 첫번째 자식.</span>
		<p>다른 div의 첫번째 단락, 이 div의 두번째 자식.</p>
		<p>다른 div의 마지막 단락, 이 div의 세번째 자식.</p>
		<span>span 요소, 이 div의 마지막 자식.</span>
	</div><br>
	<div style="border:1px solid">
		<p>다른 div의 첫번째 단락, 이 div의 첫번째 자식.</p>
		<p>다른 div의 마지막 단락,이 div의 마지막 자식.</p>
	</div>
	<p>body의 마지막 단락,, div의 첫번째 자식.</p>
	<button id="last">last</button>
	<button id="last-child">last-child</button>
	<button id="last-of-type">last-of-type</button><br><br>
</body>
</html>
