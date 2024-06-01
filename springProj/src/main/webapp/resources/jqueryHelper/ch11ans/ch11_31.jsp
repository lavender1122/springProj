<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* 콜백 함수
	- 자바스크립트 문은 한 줄씩 사용됨.
	- 효과를 사용하면 효과가 완료되지 않은 경우에도 다음 코드 줄을 실행할 수 있어
		오류가 발생할 수 있음
	- 이를 방지하기 위해 콜백 함수를 만듦
	- 콜백 함수는 현재 효과가 완전히 끝난 후에 실행됨
		$(selector).hide(speed, callback)
	*/
	function message(){
    	setTimeout(() => console.log("이미지는 잠시 후 사라질 것이다..."), 2000);
    }
	
	$(function(){
	    $("button").click(function(){
	    	//hide() 메서드의 매개변수의 콜백 함수로 message()를 지정함
	        $("#hydrangeas").hide("slow", message());
	    });
	});
</script>
</head>
<body>
	<button>Hide</button>
	<p>This is callBack Function..</p>
   	<img id="hydrangeas" src="/images/hydrangeas.jpg" alt="hydrangeas" 
              width="300" height="200" />
</body>
</html>
