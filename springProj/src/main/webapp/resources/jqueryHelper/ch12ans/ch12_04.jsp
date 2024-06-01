<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//attr() 메서드 : 속성 값을 설정/변경하는 데 사용됨
	$(function(){
	    $("button").click(function(){
	    	//링크에서 href 속성 값을 변경(설정)
	        $("#w3s").attr("href", "https://www.google.com");
	    });
	});
</script>
</head>
<body>
	<p>
		<a href="https://www.w3schools.com" id="w3s">Changing URL</a>
	</p>
	<button>Change href Value</button>
	<p>Mouse over the link (or click on it) to see 
	 that the value of the href
     attribute has changed.</p>
</body>
</html>
