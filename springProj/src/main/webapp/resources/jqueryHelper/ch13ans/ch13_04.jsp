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
		//GET 메서드를 사용하여 정보(Henry, ford)를 서버로 보내기 위해 
		//	URL에 정보를 추가함
		xhttp.open("GET", "/upload/demo_get2.jsp?fname=Henry&lname=Ford", true);
		xhttp.send();
	}
</script>
</body>
</html>
