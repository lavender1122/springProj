<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<p>Looping through an array using a for in loop:</p>
	<p id="demo"></p>
<script>
	var myObj, i, x = "";
	myObj = {
		    "name":"John",
		    "age":30,
		    "cars":[ "Ford", "BMW", "Fiat" ]
	};

	//for 문으로 바꾸어 사용할 수 있음
	for (i = 0; i < myObj.cars.length; i++) {
    x += myObj.cars[i] + "<br />";
	}
	document.getElementById("demo").innerHTML = x;
</script>
</body>
</html>
