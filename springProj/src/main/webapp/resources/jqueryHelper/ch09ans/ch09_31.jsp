<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	//type의 :text와 :password 선택자 적용
	$(function(){
		$("#Text").click(function(){
			// type 속성의 text 값에 해당되는 모든 요소에 적용 
			$(":text").css("background-color", "red");
		});
		$("#Password").click(function(){
			// type 속성의 password 값에 해당되는 모든 요소에 적용
			$(":password").css("background-color", "red");
		});		
	});
</script>
</head>
<body>
	<form action="">
		Id: <input type="text" name="id" /><br />
		Name: <input type="text" name="user" /><br />
		Password: <input type="password" name="password" /><br />
		<button type="button">Useless Button</button>
		<input type="reset" value="Reset">
		<input type="submit" value="Submit"><br>
	</form>
    <button id="Text">Text Test</button>
    <button id="Password">Password Test</button>
</body>
</html>
