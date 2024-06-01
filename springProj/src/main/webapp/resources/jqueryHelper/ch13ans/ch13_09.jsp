<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
/*
  웹 브라우저는 다른 작업을 진행하다가 서버로부터 응답을 받았을 때 처리해야 할 일을
 XMLHttpRequest 객체 속성의 콜백 함수로 지정함
 1) onreadystatechange : readyState 속성이 변경될 때 호출할 함수를 정의함
 	서버의 readyState 등록 정보의 값이 변경될 때 실행할 함수를 정의함
 2) readyState : XMLHttpRequest의 상태를 보유함
 	- 0 : 요청이 초기화되지 않음 : open() 호출 전의 상태
 	- 1 : 서버 연결이 설정 됨 : send() 이전 상태
 	- 2 : 서버에서 요청이 수신된 상태
 	- 3 : 서버에서 처리 중인 상태
 	- 4 : 서버에서 요청이 완료되고, 응답이 준비된 상태
 3) status : 서버의 처리 결과 코드
 	- 200 : OK(성공)
 	- 403 : forbidden(접근 거부)
 	- 404 : Page not found(파일/페이지 없음)
 4) statusText : 상태 텍스트를 반환(ex : OK 또는 Not Found)
 */
$(function(){
    $("button").click(function(){
    	//1) 동기식은 클라이언트의 웹페이지가 서버에 데이터를 요청하면
    	//	그 데이터가 서버로부터 도착하여 임의의 작업을 완료할 대까지 
    	//	웹 페이지는 기다림
    	//2) 비동기식은 서버에 요청 후 웹 페이지 나름대로 처리할 작업을 한 후
    	//	서버로부터 데이터가 도착하면 그 데이터를 처리함
        $.ajax({
        	url: "/upload/abcde.txt", 
        	async: false, 
        	success: function(result){
	            $("div").html(result);
   	   		}
		});
   	});
});

</script>
</head>
<body>
	<div id="div1"><h2>Let jQuery AJAX Change This Text</h2></div>
	<button>Get External Content</button>
</body>
</html>
