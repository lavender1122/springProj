<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#demo").click(function(){
			// :input 선택자
			// 입력 양식 요소의 배경 색상을 빨간색으로 설정. 
			//버튼도 함께 적용됨
			$(":input").css("background-color", "red");
		});
	});
</script>
</head>
<body>
	<h2>입력 요소 선택자</h2>
	<p>
		<img src="/images/ch09_30_01.jpg"  />
	</p>
	<form action="">
		Name: <input type="text" name="user"><br>
		Password: <input type="password" name="password"><br>
		<button type="button">Useless Button</button>
		<input type="reset" value="Reset">
		<input type="submit" value="Submit"><br>
	</form>
    <button id="demo">Demo Button</button>
</body>
</html>
