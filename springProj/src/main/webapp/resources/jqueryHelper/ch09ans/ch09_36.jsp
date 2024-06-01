<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	$(function(){
		//document 내의 요소가 로딩된 후 바로 실행 됨
		//type 속성의 값이 file인 요소를 선택
	    $(":file").css("background-color", "red");
	});
</script>
</head>
<body>
	<form action="">
	  Name: <input type="text" name="user"><br>
	  File: <input type="file" name="myfile">
	</form>
</body>
</html>
