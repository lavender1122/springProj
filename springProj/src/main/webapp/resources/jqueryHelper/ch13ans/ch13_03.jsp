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
		xhttp.open("GET", "/upload/demo_get.jsp?t=" 
				+ Math.random(), true);
		xhttp.send();
	}
</script>
</body>
</html>
