<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	 event.target은 부모로부터 이벤트가 위임되어 발생하는 자식의 위치, 
	 내가 클릭한 자식 요소를 반환한다.
	 하지만 currentTarget은 이벤트가 부착된 부모의 위치를 반환
	
	1. event.delegateTarget 속성 : 현재 호출된 이벤트 핸들러가 부착된 요소 반환
	2. event.currenttarget : 이벤트 핸들러가 부착된 것을 가리킴
	
	delegate : 대표, 위임하다
	*/
	$(function(){
	    $("body").on("click", "button", function(event){
			$("p").text("delegateTarget returns: " 
					+ event.delegateTarget.nodeName 
					+ " currentTarget returns: " 
                    + event.currentTarget.nodeName);
	    });
	});
</script>
</head>
<body>
	<h3>Show the difference between delegateTarget 
	and currentTarget</h3>
	<button>Test the difference</button>
    <p></p>
</body>
</html>
