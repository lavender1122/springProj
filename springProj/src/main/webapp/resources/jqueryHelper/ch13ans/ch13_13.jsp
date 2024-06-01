<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
	/* 콜백 매개변수는 load() 메서드가 완료될 때 실행할 콜백 함수를 지정함
	- 콜백 함수의 매개변수
		responseTxt : 호출이 성공하면 결과 내용을 포함함
		statusTxt : 통화 상태를 포함함
		xhr : XMLHttpRequest 객체를 포함함
	*/
    $("button").click(function(){
    	console.log("왔다");
       $("#div1").load("/upload/abcde.txt", function(responseTxt, statusTxt, xhr){
    	   console.log("statusTxt : " + statusTxt);
           if(statusTxt == "success")
              console.log("External content loaded successfully!");
           if(statusTxt == "error")
           	console.log("Error: " + xhr.status + ": " + xhr.statusText);
        });
	});	
});
</script>
</head>
<body>
	<button>Send an HTTP POST request to a page and get the result back</button>
</body>
</html>
