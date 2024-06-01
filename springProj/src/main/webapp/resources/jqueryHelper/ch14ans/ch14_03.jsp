<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<h2>Store and retreive data from local storage.</h2>
	<p id="demo"></p>
<script>
	//데이터를 저장할 때 데이터는 특정 형식이어야 하며 저장할 위치와 상관없이 텍스트는
	//	항상 합법적인 형식 중 하나임
	//JSON 파일의 파일 형식은 확장자가 ".json"이고,
	//	JSON 텍스트의 MIME 유형은 "application/json"임
	var myObj, myJSON, text, obj;
//Storing data:
	myObj = { "name":"John", "age":31, "city":"New York" };
	myJSON = JSON.stringify(myObj);
	localStorage.setItem("testJSON", myJSON);
//Retrieving data:
	text = localStorage.getItem("testJSON");
	obj = JSON.parse(text);
	document.getElementById("demo").innerHTML = obj.name;
</script>
</body>
</html>
