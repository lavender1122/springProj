<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
<body>
	<h2>Create Object from JSON String</h2>
	<p id="demo"></p>
<script>
	/* JSON.parse()
	- JSON은 웹 서버와 데이터를 교환하는데 주로 사용됨
	- 웹 서버에서 데이터를 수신할 때 데이터는 항상 문자열임
	- JSON.parse()를 사용하여 데이터를 파싱하면 데이터가 자바스크립트 객체가 됨
	*/
	//JSON.parse() 자바스크립트 함수를 사용하여 텍스트를 자바스크립트 객체로 변환함
	var obj = JSON.parse('{ "name":"John", "age":30, "city":"New York"}');
	document.getElementById("demo").innerHTML = obj.name + ", " + obj.age;
</script>
</body>
</html>
