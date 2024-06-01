<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
	/* setInterval()
	- 웹페이지의 특정 부분을 주기적으로 업데이트해줘야 하거나
		어떤 API로부터 변경된 데이터를 주기적으로 받아와야 하는 경우 사용
	- 어떤 코드를 일정한 시간 간격을 두고 반복해서 실행하고 싶을 때 사용
	- setTimeout()함수와 대동소이.
	- 첫번째 인자로 실행할 코드를 담고 있는 함수를 받음
	- 두번째 인자로 반복 주기를 밀리초(ms) 단위로 받음
	*/
	setInterval(() => console.log(new Date()), 2000);
	
	//0과 9 사이의 수를 무작위로 생성하여 3초마다 출력
	setInterval(() => console.log(Math.floor(Math.random() * 10)), 3000);
	
	//숫자를 변수에 저장해놓고 2초 마다 1씩 증가
	let count = 0;
	let intervalId = setInterval(() => console.log(++count), 1000);
	
	//setInterval() 함수는 인터벌 아이디(Interval ID)라고 불리는 숫자를 반환함
	//인터벌 아이디는 setInterval() 함수를 호출할 때마다 내부적으로 생성되는
	//	타이머 객체를 가리키고 있음.
	//	이 값을 인자로 clearInterval() 함수를 호출하면 코드가 주기적으로 실행되는
	//	것을 중단시킬 수 있음
	clearInterval(intervalId);
	
	/*
	마지막으로 setTimeout() 함수와 setInterval() 함수를 사용한 후에는 
	반드시 clearTimeout() 함수와 clearInterval() 함수를 사용해서 
	타이머를 청소해주자.
	특히, SPA(Single Page Application)을 개발할 때는 
	이 부분이 메모리 누수(memory leak)로 이어질 수 있기 때문에 각별히 주의하자
	*/
</script>
</head>
<body>
</body>
</html>
