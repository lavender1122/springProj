<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
<!-- 서버에서 반환되는 배열 
	- 배열에서 파생된 JSON에서 JSON.parse()를 사용하면 다음 메서드는 자바스크립트 객체 대신
		자바스크립트 배열을 반환.
	- 다음에서 서버에서 반환된 JSON은 배열임
 -->
	<h2>Content as Array.</h2>
	<p>Content written as an JSON array will be converted 
        into a JavaScript array.</p>
	<p id="demo"></p>
<script>
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	        myArr = JSON.parse(this.responseText);
	        document.getElementById("demo").innerHTML = myArr[0] + "," + myArr[1];
	    }
	};
	//[ "국어", "영어", "수학", "과학" ]
	xmlhttp.open("GET", "json_demo_array.txt", true);
	xmlhttp.send();
</script>
	<p>Take a look at <a href="json_demo_array.txt" target="_blank">
    json_demo_array.txt</a></p>
</body>
</html>
