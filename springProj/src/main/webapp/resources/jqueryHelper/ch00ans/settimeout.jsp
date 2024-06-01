<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
	/* setTimeOut()
	- 어떤 코드를 바로 실행하지 않고 일정 시간 기다린 후 실행
	- 첫 번재 인자로 실행할 코드를 담고 있는 함수를 받고
	- 두 번째 인자로 지연 시간을 밀리초(ms) 단위로 받음
	- 세 번째 인자부터는 가변 인자를 받음. 첫번째 인자로 넘어온 함수가 인자를 받는 경우, 
		이 함수에 넘길 인자를 명시해주기 위해서 사용함
	*/
	setTimeout(() => console.log("2초 후에 실행 됨"), 2000);
	
	function add(x,y){
		console.log(x + y);
	}
	
	setTimeout(add, 5000, 3,4);
	
	/*
	- 타임아웃 아이디(Timeout ID)라고 불리는 숫자를 반환
	- 타임아웃 아이디는 setTimeout() 함수를 호출할 때마다 내부적으로 생성되는
		타이머 객체를 가리키고 있음.
		이 값을 인자로 clearTimeout() 함수를 호출하면 
		기다렸다가 실행될 코드를 취소할 수 있음
	*/
	let timeoutId = setTimeout(() => console.log("7초 후에 실행됨"), 7000);
	console.log("timeoutId : " + timeoutId);
// 	clearTimeout(timeoutId);
</script>
</head>
<body>
</body>
</html>
