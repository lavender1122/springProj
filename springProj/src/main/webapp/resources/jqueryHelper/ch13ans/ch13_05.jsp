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
		/* POST 요청
		- POST는 GET에 비해 무겁고, 강함
		- 다음의 경우 항상 POST 요청을 사용해야 함
			서버의 파일 또는 데이터베이스 업데이트
			서버에 많은 양의 데이터 전송(POST에는 크기 제한이 없음)
			보안성이 중요한 경우
		*/
		function loadDoc() {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("demo").innerHTML =
						this.responseText;
				}
			};
			//open() 메서드의 두 번재 매개변수는 url임
			//서버에 있는 파일에 대한 주소
			//이 파일은 .txt 및 .xml가 같은 종류의 파일이거나
			//.jsp 및 .php와 같은 서버 스크립팅 파일(응답을 다시 보내기 전에
			//	서버에서 작업을 수행 할 수 있음)일 수 있음
			//비동기방식 : 서버가 자료를 처리하고 있는 동안에 사용자가 
			//	웹 브라우저에서 다른 작업을 할 수 있다면 매우 효율적임
			//AJAX는 서버의 응답을 기다리지 않고 다른 작업을 수행할 수 있도록 지원
			//서버의 응답이 준비되었을 때 그 으압에 반응함
			//false를 지정하면 동기성이 적용됨. 
			//동기성 : 이러한 일련의 과정들이 하나의 절차적 관리에 의해 진행되므로
			//	웹 브라우저는 서버로부터 정보를 받아야만 다음 과정을 진행할 수 있음
			xhttp.open("POST", "/upload/demo_post2.jsp", true);
			//POST 방식으로 데이터를 보내려면 setRequestHeader()로 
			//	HTTP 헤더를 추가함
			//header : header 이름을 명시
			//	Content-type 값을 설정하여야 서버에서 데이터를 인식할 수 있음
			//	application/x-www-form-urlencoded로 설정
			//value : header 값을 명시			
			xhttp.setRequestHeader("Content-type", 
							   "application/x-www-form-urlencoded");
			//send() 메서드에서 전송할 데이터를 지정함
			//이와 함께 서버로 전송하려는 데이터는 fname=Henry&lname=Ford와
			//	같은 쿼리 문자열을 인수로 추가함
			xhttp.send("fname=Henry&lname=Ford");
		}
	</script>
</body>
</html>
