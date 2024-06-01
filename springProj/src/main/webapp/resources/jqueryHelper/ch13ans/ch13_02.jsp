<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
</head>
<body>
	<div>
		<h2>The XMLHttpRequest Object</h2>
		<button type="button" onclick="loadDoc()">Change Content</button>
	</div>
	<p id="demo"></p>
<script>
	function loadDoc() {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("demo").innerHTML 
				= this.responseText;
		    }
		};
		//GET은 POST보다 간단하고 빠르며, 대부분의 경우 단순히 텍스트 파일을
		//	요청할 때 사용할 수 있음. 보안성이 취약한 점이 단점임
		xhttp.open("GET", "/upload/demo_get.jsp", true);
		xhttp.send();
	}
</script>
</body>
</html>
