<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>
<body>
	<!-- JSON의 문자열로 변환
	- JSON은 웹 서버와 데이터를 교환하는데 주로 사용됨
	- 웹 서버에 데이터를 보낼 때 데이터는 문자열이어야 함
	- JSON.stringify()로 자바스크립트 객체를 문자열로 변환함 
	
	 -->
	<h2>Create JSON string from a JavaScript object.</h2>
	<p id="demo"></p>
<script>
	//자바스크립트 객체 -> 문자열로 변환
	//자바스크립트 객체
	var obj = { "name":"John", "age":30, "city":"New York"};
	//JSON.stringify() 자바스크립트 함수를 사용하여 다음을 문자열로 변환함
	//myJSON은 이제 문자열이며 서버에 보낼 준비가 됨
	var myJSON = JSON.stringify(obj);
	document.getElementById("demo").innerHTML = myJSON;
</script>
</body>
</html>
