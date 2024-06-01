<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
$(function(){
	//type의 :image 선택자를 적용함
	$("#image").click(function(){
		//이미지의 너비를 100 픽셀로 줄임
	    $(":image").css("width", "100");
		//이미지의 높이를 100 픽셀로 줄임
		$(":image").css("height", "100");
	});
});
</script>
</head>
<body>

<form action="">
  Name: <input type="text" name="user"><br>
  Password: <input type="password" name="password"><br>
  Compatible: <input type="image" src="yacht.jpg" width="200" height="200">
</form>
<button id="image">image Test</button>
</body>
</html>
