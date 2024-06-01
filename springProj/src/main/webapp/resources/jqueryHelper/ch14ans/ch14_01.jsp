<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
</head>

<body>
	<h2>Convert a JavaScript object into a JSON string, 
	and send it to the server.</h2>
	<h5>
	<p>JSON은 JavaScript Object Notation의 약자.</p>
	<p>JSON은 텍스트에 기반을 둔 데이터 저장 및 교환을 위한 구문임</p>
	<p>JSON은 자바스크립트 객체 표기법으로 작성된 텍스트임</p>
	<p>JSON은 브라우저와 서버 간에 데이터를 교환할 때 데이터는 텍스트일 뿐임</p>
	<p>모든 자바스크립트 객체를 JSON으로 변환하고 JSON을 서버로 보낼 수 있음</p>
	<p>서버에서 받은 JSON을 자바스크립트 객체로 변환할 수 있음</p>
	<!-- 
	client -> server (string 형식으로 전달)
	server -> client (string 형식으로 전달)
	string으로 받아온 데이터를 다시 Object로 변환하여 브라우저에 표기!
	object -> string 으로 변환하는 방식을 serialize 라고 한다!
	string -> object로 다시 변환하는 방식을 deserialize라고 함!
	 -->
	</h5>
<script>
	var myObj = { "name":"John", "age":31, "city":"New York" };
	//JSON.stringify() 함수는 객체를 텍스트로 변환하는 메서드임
	var myJSON = JSON.stringify(myObj);
	console.log("myJSON : " + myJSON);
// 	window.location = "/upload/demo_json.jsp?x=" + myJSON;
</script>
</body>
</html>
