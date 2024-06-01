<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
</head>

<body>
	<h1>The XMLHttpRequest Object</h1>
	<button type="button" onclick="loadDoc()">Request data</button>
	<p id="demo"></p>
	<script>
		function loadDoc() {
			var xhttp = new XMLHttpRequest();
			//async=false로 사용하는 것은 권장하지 않지만 몇 가지 작은 요청의 경우
			//	괜찮을 수 있음
			//자바스크립트는 서버 응답이 준비될 때가지 계속 기다리게 됨
			//서버가 사용 중이거나 느린 경우 응용 프로그램은 중단된 상태임
			//async=false를 사용 시 onreadystatechange 함수를
			//	작성할 필요가 없음
			//	그대로 서버로부터 응답에 반응한 후 진행해야 할 작업을
			//	하단에 추가적으로 기술하면 됨
			xhttp.open("GET", "/upload/abcde.txt", false);
			xhttp.send();
			document.getElementById("demo").innerHTML 
			= xhttp.responseText;
		}
	</script>
</body>
</html>
