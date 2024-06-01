<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//달러.post() 메서드는 HTTP POST 요청을 사용하여 서버의 데이터를 요청함
	    	//달러.post()의 첫 번째 매개변수는 요청하고자 하는 URL이고,
	    	//두 번째 매개변수는 요청과 함께 보낼 일부 데이터를 전달함
	    	//세 번재 매개변수는 콜백 함수
	        $.post("/upload/demo_post2.jsp",
		        {
	        	  fname: "Donald Duck",
		          lname: "Duckburg"
		        },
	        function(data,status){
	            console.log("Data: " + data + "\nStatus: " + status);
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
