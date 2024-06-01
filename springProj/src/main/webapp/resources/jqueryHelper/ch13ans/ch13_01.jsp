<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
</head>
<body>
	<!-- 
	div 섹션은 서버로부터 받은 정보를 표시하는데 사용됨
	 -->
	<div id="demo">
		<h2>The XMLHttpRequest Object</h2>
		<button type="button" onclick="loadDoc()">Change Content</button>
	</div>
<script>
	function loadDoc() {
		/*
		- 웹 서버에 데이터를 요청하고 이를 표시함
		- AJAX를 실행하기 위해서는 필수적으로 서버가 요구됨
		- AJAX는 XMLHttpRequest 객체가 가장 중요함
		- 최신 모든 웹 브라우저에서는 기본적으로 XMLHttpRequest 객체가
			지원됨
		- XMLHttpRequest 객체는 웹 페이지 뒤에 숨어서 서버와 데이터를 교환하도록 지원함
		- 웹 브라우저가 서버와 정보 교환을 통하여 페이지의 내용을 변경하고자 할 때 
			전체 페이지를 로드하지 않고 웹 페이지의 일부(수정된 부분만)를
			업데이트할 수 있도록 지원함
		- 이때 웹 페이지가 서버와 주고받는 정보는 XML 문서임.
		*/
		//XMLHttpRequest 객체를 생성
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			/*readyState 
				0 : 요청이 초기화되지 않았음을 의미
				1 : 서버 연결 설정됨
				2 : 요청이 접수
				3 : 처리 요청
				4 : 요청이 완료되고 응답이 준비됨
			*/	
			/*status
				200 : 정상처리
				403 : 금지
				404 : 찾을 수 없음
			*/
			if (this.readyState == 4 && this.status == 200) {
			      document.getElementById("demo").innerHTML 
			      	= this.responseText;
		    }
		};
		//XMLHttpRequest 객체는 서버와 데이터를 교환하는데 사용됨
		//서버에 요청을 보내려면 XMLHttpRequest 객체의 open() 및 send()에서드 사용
		xhttp.open("GET", "/upload/abcde.txt", true);
		xhttp.send();
	}
</script>
</body>
</html>
