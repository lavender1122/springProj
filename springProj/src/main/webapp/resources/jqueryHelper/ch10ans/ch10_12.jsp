<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* keypress() 메서드
	- keypress 이벤트를 자동 실행하거나 이벤트가 발생할 때 실행할 함수를 연결함
	- keypress 이벤트는 keydown 이벤트와 유사함
	- keypress 이벤트는 일부 키(alt, ctrl, shift, esc)에 대해 실행되지 않음
	*/
	var i=0;
	$(function(){
		//<input> 태그 내의 텍스트 창에 임의의 키를 누르면
		//입력된 문자의 수를 출력함
	    $("input").keypress(function(){
	        $("span").text(i += 1);
	    });
		
	});
</script>
</head>
<body>
	Enter your name: <input type="text" />
	<p>Keypresses: <span>0</span></p>
</body>

</html>
