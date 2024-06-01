<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<h2>Convert a string written in JSON format
	, into a JavaScript object.</h2>
	<p id="demo"></p>
<script>
	var myJSON = '{ "name":"John", "age":31, "city":"New York" }';
	//서버의 JSON 형식의 데이터를 웹 브라우저가 받으면 자바스크립트 객체로 변환할 수 있음
	var myObj = JSON.parse(myJSON);
	document.getElementById("demo").innerHTML = myObj.name;
	$("#demo").append("<p>"+myObj.age+"</p>");
	$("#demo").append("<p>"+myObj.city+"</p>");
</script>
</body>
</html>
