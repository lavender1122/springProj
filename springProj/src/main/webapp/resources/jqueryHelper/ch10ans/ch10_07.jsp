<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* focus() / blur() 메서드
	- 가장 대표적인 form 이벤트
	1. focus() : 양식 필드에 포커스가 있을 때 발생 함. 
		포커스의 발생은 해당 입력 양식에 마우스를 클릭함에 의하거나 
		그 곳으로 탭 기능을 이용하여 커서를 이동하였을 때 발생함
	2. blur() : 양식 필드가 포커스를 잃을 때 함수가 실행 됨	
	*/
	$(function(){
	    $("input").focus(function(){
	        $(this).css("background-color", "#cccccc");
	    });
	    $("input").blur(function(){
	        $(this).css("background-color", "#ffffff");
	    });
	});
</script>
</head>
<body>
	Name: <input type="text" name="fullname" /><br />
	Email: <input type="text" name="email" />
</body>
</html>
