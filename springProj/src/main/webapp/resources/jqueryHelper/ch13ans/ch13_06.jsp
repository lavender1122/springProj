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
			//서버로부터 응답이 있을 때 실행할 함수.
			//응답이 올 때까지 웹 브라우저에서는 다른 작업이 진행됨
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("demo").innerHTML =
						this.responseText;
				}
			};
			//async=true를 사용하는 경우. onreadystatechange() 이벤트에서
			//	응답이 준비되면 실행할 함수를 지정함
			xhttp.open("GET", "/upload/abcde.txt", true);
			xhttp.send();
		}
	</script>
</body>
</html>
