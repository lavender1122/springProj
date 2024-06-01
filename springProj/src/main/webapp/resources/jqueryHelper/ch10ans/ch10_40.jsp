<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	/* 자바스크립트 이벤트 리스너에서 preventDefault() 와 stopPropagation()
		그리고 return false는 자바스크립트 프로그래밍 시 이벤트 중단을 위해 자주
		사용되는 코드들임
	- 이벤트 중단 시 사용되는 방식에 대한 간단 정리
	1) event.preventDefault() : 현재 이벤트의 기본 동작을 중단함
	2) event.stopPropagation() : 현재 이벤트가 상위로 전파되지 않도록 중단함
	3) event.stopImmediatePropagation() :
		현재 이벤트가 상위뿐 아니라 현재 레벨에 걸린 다른 이벤트도 동작하지 않도록 중단함		
	*/
	    $("span").click(function(event){
	        event.stopPropagation();
			console.log("Was event.stopPropagation() called: " 
					+  event.isPropagationStopped());
			console.log("The span element was clicked.");
	    });
	    $("p").click(function(event){
	    	console.log("The p element was clicked.");
	    });
	    $("div").click(function(){
	    	console.log("The div element was clicked.");
	    });
	});
</script>
</head>
<body>
	<div style="height:100px;border:1px solid blue;background-color:lightblue;">
	This is a div element.
		<p style="background-color:pink">p element(in the div element)
        	<span style="background-color:yellow"><br />a span element.</span>
         </p>
	</div>
	<p>the parent elements. </p>
	<p>now bubble up to parent elements.</p>

</body>
</html>
