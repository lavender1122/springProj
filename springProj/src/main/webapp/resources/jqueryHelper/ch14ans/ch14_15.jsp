<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<p>How to modify an array value of a JSON object.</p>
	<p id="demo"></p>
<script>
	/* 배열 값 수정
	- 인덱스 번호를 사용하여 배열 값을 수정할 수 있음
	*/
	var myObj, i, x = "";
	myObj = {
		    "name":"John",
		    "age":30,
		    "cars":[ "Ford", "BMW", "Fiat" ]
	};
	myObj.cars[1] = "Mercedes";
	for (i in myObj.cars) {
		    x += myObj.cars[i] + "<br />";
	}
	document.getElementById("demo").innerHTML = x;
</script>
</body>
</html>
