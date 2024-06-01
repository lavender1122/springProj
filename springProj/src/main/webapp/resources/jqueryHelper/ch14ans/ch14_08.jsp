<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<p>How to access nested JSON objects.</p>
	<p id="demo"></p>
<script>
	//MyObj 객체 내에 cars 객체가 존재함
	var myObj = {
	  "name":"John",
	  "age":30,
	  "cars": {
			"car1":"Ford",
		    "car2":"BMW",
		    "car3":"Fiat"
	   }
	}
	document.getElementById("demo").innerHTML += myObj.cars.car2 + "<br />";
//or: 	document.getElementById("demo").innerHTML += myObj.cars["car2"];
</script>
</body>
</html>
