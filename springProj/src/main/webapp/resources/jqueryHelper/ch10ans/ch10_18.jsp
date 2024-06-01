<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//함수에 데이터 전달
	function handlerName(event) {
		//id="demo"인 요소의 텍스트에 발생한 이벤트의 데이터 값의
		//msg 속성 값을 출력함
	    $("#demo").text(event.data.msg);
	}
	$(function(){
		//이벤트("click")와 데이터(msg:..), 함수(handlerName)에 의해
		//9~13줄이 실행됨
	    $("p").on("click", {msg: "You just clicked me!"}, 
	    		handlerName)
	});
</script>
</head>
<body>
	<p>Click me!</p>
    <p id="demo"></p>
</body>

</html>
