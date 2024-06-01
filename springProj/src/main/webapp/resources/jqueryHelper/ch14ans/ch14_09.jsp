<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<p>How to modify values in a JSON object.</p>
	<p id="demo"></p>
<script>
	var myObj, i, x = "";
	myObj = {
			  "name":"John",
			  "age":30,
			  "cars": {
					    "car1":"Ford",
					    "car2":"BMW",
					    "car3":"Fiat"
					  }
			}
	//점 표기법과 대괄호 표기법을 사용하여 JSON 객체의 값을 수정할 수 있음
	myObj.cars.car2 = "Mercedes";
// 또는 myObj.cars["car2"] = "Mercedes";	
	for (i in myObj.cars) {
		x += myObj.cars[i] + "<br />";
	}
	document.getElementById("demo").innerHTML = x;
</script>
</body>
</html>
