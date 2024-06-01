<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* mousemove 이벤트
	- 마우스 포인터가 선택된 요소 내에서 움직일 때마다 이벤트가 발생함
	- 이 이벤트는 사용자가 마우스를 한 픽셀 이동할 때마다 이벤트가 발생함
	
	*/
	$(function(){
		//이벤트의 함수에 매개변수로 event를 사용함
	    $(document).mousemove(function(event){
	    	//<span> 태그의 텍스트 값으로 마우스가 이동하면 그곳의 좌표 값 출력
	        $("span").text(event.pageX + ", " + event.pageY);
	    });
	});
</script>
</head>
<body>
	<p>Mouse is at coordinates: <span></span>.</p>
</body>
</html>
