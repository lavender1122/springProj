<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* :first와 :first-child, :first-of-type 선택자의 차이점
	같은 기능으로 인식되지만 명확한 차이점이 있음	
	*/
	$(function(){
	    $("#first").click(function(){
	    	//부모 노드(<body>)의 첫 번째 자식 노드 요소를 선택
	        $("p:first").css("background-color", "yellow"); 
	    });
		$("#first-child").click(function(){
			//부모 태그를 기준으로 자식 요소 중에서 첫 번째 해당하는 <p> 태그의 요소를 선택
	        $("p:first-child").css("background-color", "yellow"); 
	    });
		$("#first-of-type").click(function(){
			//자식 요소 중에서 지정된 태그와 같은 첫 번재 요소를 선택
			//<p> 태그 중에서 첫 번재 하위 요소를 선택함
	        $("p:first-of-type").css("background-color", "yellow"); 
	    });
	});
</script>
</head>
<body>
	<p>body의 첫 번째 단락, div의 첫 번째 자식.</p>
	<div style="border:1px solid;">
		<p>div의 첫 번째 단락, div의 첫 번째 자식.</p>
		<p>div의 마지막 단락, div의 마지막 자식.</p>
	</div>
	<br />
	<div style="border:1px solid;">
		<span>span 요소, 이 div의 첫 번째 자식.</span>
		<p>다른 div의 첫 번째 단락, 이 div의 두 번째 자식.</p>
		<p>다른 div의 마지막 단락, 이 div의 세 번째 자식.</p>
		<span>span 요소, 이 div의 마지막 자식.</span>
	</div>
	<br />
	<div style="border:1px solid">
		<p>다른 div의 첫 번째 단락, 이 div의 첫 번째 자식.</p>
		<p>다른 div의 마지막 단락,이 div의 마지막 자식.</p>
	</div>
	<p>body의 마지막 단락,, div의  첫 번째 자식.</p>
	<button id="first">first</button>
	<button id="first-child">first-child</button>
	<button id="first-of-type">first-of-type</button><br><br>
</body>
</html>
