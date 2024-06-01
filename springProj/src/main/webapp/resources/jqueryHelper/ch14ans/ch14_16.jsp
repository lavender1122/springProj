<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<p>How to delete properties of an array.</p>
	<p id="demo"></p>
<script>
	/* 배열 항목 삭제
	- 배열에서 항목을 삭제하려면 delete 키워드를 사용함
	*/
	var myObj, i, x = "";
	myObj = {
			  "name":"John",
			  "age":30,
			  "cars": ["Ford","BMW","Fiat"]
	}
	delete myObj.cars[1];
	for (i in myObj.cars) {
			    x += myObj.cars[i] + "<br />";
	}
	document.getElementById("demo").innerHTML = x;
</script>
</body>
</html>
