<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	//type의 :submit와 :reset 선택자를 적용
	$(function(){
		$("#submit").click(function(){
			//입력 양식의 type 속성의 값이 submit으로 정의된 요소와
			//함수 실행을 위한 버튼이 선택됨(id="submit", id="reset"도 포함)
			$(":submit").css("background-color", "red");
		});
		$("#reset").click(function(){
			//입력 양식의 type 속성의 값이 reset으로 정의된 요소를 선택
			$(":reset").css("background-color", "red");
		});
	});
</script>
</head>
<body>
	<form action="">
		Name: <input type="text" name="user"><br>
		Password: <input type="password" name="password"><br>
		<button type="button">Useless Button</button>
		<input type="reset" value="Reset">
		<input type="submit" value="Submit"><br>
	</form>
    <button id="submit">submit Test</button>
    <button id="reset">reset Test</button>
</body>
</html>
