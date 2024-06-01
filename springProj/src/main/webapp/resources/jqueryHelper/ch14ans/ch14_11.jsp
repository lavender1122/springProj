<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<p>Access an array value of a JSON object.</p>
	<p id="demo"></p>
<script>
	/* 배열 값에 접근하기
		인덱스 번호를 사용하여 배열 값을 액세스함
	*/
	var myObj, x;
	myObj = {
		    "name":"John",
		    "age":30,
		    "cars":[ "Ford", "BMW", "Fiat" ]
	};
	x = myObj.cars[0];
	document.getElementById("demo").innerHTML = x;
</script>
</body>
</html>
