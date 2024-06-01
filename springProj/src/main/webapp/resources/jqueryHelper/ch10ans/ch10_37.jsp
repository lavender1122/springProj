<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* 키보드 이벤트
	1. KeyDown : 키를 처음 누를 때 발생
	2. KeyUp : 키를 놓으면 발생
	3. KeyPress : 키를 누를 때마다 발생합니다. 
			키를 누르고 있으면 KeyPress 이벤트가 운영 체제에 정의된 반복 속도로 발생
	4. MouseDown : 포인터가 컨트롤 위에 있을 때 마우스 단추를 누르면 발생
	5. MouseEnter : 포인터가 컨트롤의 지역에 먼저 들어가면 발생
	6. MouseHover : 포인터로 컨트롤을 가리키면 발생
	7. MouseLeave : 포인터가 컨트롤의 지역을 벗어나면 발생
	8. MouseMove : 포인터가 컨트롤의 지역에서 이동하면 발생
	9. MouseUp : 포인터가 컨트롤 위에 있거나 포인터가 컨트롤의 지역을 벗어나는 
			동안 마우스 단추를 놓으면 발생
	*/
	$(function(){
	    $("input").keydown(function(event){ 
	        $("p:first").text("Key: " + event.which);
	    });
		$("input").mousedown(function(event){ 
			//Javascript에서 event.keyCode 를 하면 
			//			각 키보드에 해당하는 고유 번호를 알수있다.
			//이 메소드가 Jquery에서는 event.which 으로 사용
			//각 키보드의 고유 번호를 알수 있으며, 
			//			keydown 이벤트 외에도 사용할 수 있다
        	$("p:last").text("Mouse button pressed: " 
        			+ event.which);
	    });
	});
</script>
</head>
<body>
	Enter your name: <input type="text">
	<p id="deom01"></p>
    <p id="deom02"></p>
<div />
</body>
</html>
