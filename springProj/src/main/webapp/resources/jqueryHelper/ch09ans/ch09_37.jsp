<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	$(function(){
	   $("#enabled").click(function(){
		   // :enabled : 모든 활성화된 폼 요소를 선택
			$(":enabled").css("background-color", "red");
		});
		$("#disabled").click(function(){
			// :disabled : 비활성화 된 양식 요소를 모두 선택
			$(":disabled").css("background-color", "green");
		});
	});
</script>
</head>
<body>
	<h2>기타 선택자</h2>
	<p>
		<img src="/images/ch09_37_01.jpg" />
	</p>
	<form action="">
		Name: <input type="text" name="user"><br>
		ID:<input type="text" name="id" disabled="disabled">
		Age:<select disabled="disabled">
				<option>20세-30세</option>
				<option>30세-50세</option>
				<option>50세 이상</option>
			</select>
	</form>
    <button id="enabled">enabled Test</button>
    <button id="disabled">disabled Test</button>
</body>
</html>
