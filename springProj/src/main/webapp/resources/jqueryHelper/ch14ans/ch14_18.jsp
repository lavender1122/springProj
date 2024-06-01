<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>
<body>
<!-- 서버로부터의 JSON 
 - AJAX 요청을 사용하여 서버로부터 JSON을 요청할 수 있음
 - 서버의 응답이 JSON 형식으로 작성된 경우 그 문자열을 자바스크립트 객체로 구문 분석할 수 있음
 -->
	<h2>Use the XMLHttpRequest to get the content of a file.</h2>
	<p>The content is written in JSON format, 
       and can easily be converted into a JavaScript object.</p>
	<p id="demo"></p>
<script>
	/*
	- JSON은 웹 서버와 데이터를 교환하는데 주로 사용됨
	- 웹 서버에서 데이터를 수신할 때 데이터는 항상 문자열임
	- 이 데이터를 JSON.parse()를 사용해서 파싱하면 데이터는 자바스크립트 객체가 됨
	- 웹 서버에서 아래와 같은 텍스트를 받았다고 가정하면
		{ "이름":"김지훈", "나이":26, "지역":"서울" }
		JSON.parse() 자바스크립트 함수를 사용해서
		텍스트를 자바스크립트 객체로 변환함
		var obj = JSON.parse('{ "이름":"김지훈", "나이":26, "지역":"서울" }');
		
		var obj = JSON.parse('{ "이름":"김지훈", "나이":26, "지역":"서울" }')
		document.getElementById("demo").innerHTML = obj.이름 + ", " + obj.나이;
		
	- AJAX 요청을 사용해서 서버에 JSON을 요청할 수 있음
	- 서버의 응답이 JSON 형식으로 작성된 경우 문자열을 자바스크립트 객체로 파싱할 수 있음
	*/
	//XMLHttpRequest를 사용하여 서버에서 데이터를 가져옴
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	        myObj = JSON.parse(this.responseText);
	        document.getElementById("demo").innerHTML = myObj.이름;
	    }
	};
	xmlhttp.open("GET", "json_demo.txt", true);
	xmlhttp.send();
</script>
	<p>Take a look at <a href="json_demo.txt" target="_blank">
       json_demo.txt</a></p>
</body>
</html>
