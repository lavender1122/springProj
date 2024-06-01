<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>
<body>
	<!-- 자바스크립트 배열을 문자열로 변환 
	- 자바스크립트 배열을 문자열로 변환하는 것도 가능함
	 -->
	<h2>Create JSON string from a JavaScript array.</h2>
	<p id="demo"></p>
<script>
	//자바스크립트 배열
	var arr = [ "John", "Peter", "Sally", "Jane" ];
	//JSON.stringify() 자바스크립트 함수를 사용하여 문자열로 변환함
	//JSON 표기법을 따르는 문자열.
	//myJSON은 이제 문자열이며 서버에 보낼 준비가 됨
	var myJSON = JSON.stringify(arr);
	document.getElementById("demo").innerHTML = myJSON;
</script>
</body>
</html>
