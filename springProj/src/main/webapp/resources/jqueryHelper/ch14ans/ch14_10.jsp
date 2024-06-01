<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>

<body>
	<p>How to delete properties of a JSON object.</p>
	<p id="demo"></p>
<script>
	/*
	- JSON의 데이터 유형에는 배열이 있음. 배열은 자바스크립트의 배열과 거의 같음
	- JSON에서 배열 값은 string, number, object, array, boolean 또는
		null 유형이어야 함
	- 자바스크립트에서 배열 값은 위의 모든 것 외에도 함수, 날짜 및 undefined 등
		다른 유효한 자바스크립트 표현식을 포함할 수 있음
	*/
	var myObj, i, x = "";
	myObj = {
			  "name":"John",
			  "age":30,
			  "cars": {
					    "car1":"Ford",
					    "car2":"BMW",
					    "car3":"Fiat"
					  }
			}
	//delete 키워드를 사용하여 JSON 객체에서 속성을 삭제할 수 있음
	delete myObj.cars.car2;
	for (i in myObj.cars) {
			x += myObj.cars[i] + "<br />";
	}
	document.getElementById("demo").innerHTML = x;
</script>
</body>
</html>
