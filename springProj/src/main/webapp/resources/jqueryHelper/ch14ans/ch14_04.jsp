<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<body>
	<p>Access a JavaScript object:</p>
	<p id="demo01"></p>
    <p id="demo02"></p>
<script>
	var myObj, x, Y;
	myObj = { "name":"John", "age":30, "city":"New York" };
	x = myObj.name;
	myObj.name = "Gilbert";
	document.getElementById("demo01").innerHTML = x;
	document.getElementById("demo02").innerHTML = myObj.name;
</script>
</body>
</html>
