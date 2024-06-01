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
	    $("div").click(function(event){
	        console.log("Event handler 1 executed");
	        event.stopImmediatePropagation();
			$("p").text(
					"Was event.stopImmediatePropagation() called: " 
					+ event.isImmediatePropagationStopped());
	    });
		//event.stopImmediatePropagation()에 의해 실행 안 됨
	    $("div").click(function(event){
	        console.log("Event handler 2 executed");
	    });
	  	//event.stopImmediatePropagation()에 의해 실행 안 됨
	    $("div").click(function(event){
	    	console.log("Event handler 2 executed");
	    });
	});
</script>
</head>
<body>
	<div style="height:50px;border:1px solid blue;background-color:lightblue;">
                Click on this div element.</div>
    <p></p>

</body>
</html>
