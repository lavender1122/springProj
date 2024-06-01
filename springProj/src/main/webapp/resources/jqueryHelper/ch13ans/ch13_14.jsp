<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
    	$("button").click(function(){
    		//달러.get() 메서드 : HTTP GET 요청을 사용하여 서버에서 데이터를 로드함
    		//url은 필수 매개변수이고, 요청할 URL을 지정함
    		//선택적으로 사용되는 콜백 매개변수는 요청이 성공할 경우 실행할 함수의 이름
    		//달러.get() 메서드를 사용하여 서버의 파일에서 데이터를 검색함
	        $.get("/upload/demo_get.jsp", function(data, status){
	            console.log("Data: " + data + "\nStatus: " + status);
	        });
	    });
	});
</script>
</head>
<body>
	<button>Send an HTTP GET request to a page and get the result back</button>
</body>
</html>
