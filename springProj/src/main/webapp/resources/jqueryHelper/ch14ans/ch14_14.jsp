<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<p>Looping through arrays inside arrays.</p>
	<p id="demo"></p>
<script>
	/* 중첩된 배열
	- 배열의 값은 다른 배열 또는 다른 JSON 객체일 수 있음
	- 배열 내부의 배열에 엑세스하기 위하여 각 배열에 for-in 루프를 사용함
	*/
	var myObj, i, j, x = "";
	myObj = {
	    "name":"John",
	    "age":30,
	    "cars": [
		        { "name":"Ford", "models":[ "Fiesta", "Focus", "Mustang" ] },
        		{ "name":"BMW", "models":[ "320", "X3", "X5" ] },
		        { "name":"Fiat", "models":[ "500", "Panda" ] }
	    ]
	}
	for (i in myObj.cars) {
	    x += "<h2>" + myObj.cars[i].name + "</h2>";
	    for (j in myObj.cars[i].models) {
	        x += myObj.cars[i].models[j] + "<br />";
	    }
	}
	document.getElementById("demo").innerHTML = x;
</script>
</body>
</html>
