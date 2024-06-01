<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* change 메서드
	- <input>, <textarea> 및 <select> 요소에서만 적용 됨
	- 요소의 값이 변경되었을 때 발생 함
	- <input> 또는 <textarea>의 경우 내용이 변경된 후에
		필드가 포커스를 잃을 때 change 이벤트가 발생 함
	*/
	$(function(){
	    $("input").change(function(){
	    	//내용을 변경 후 포커스가 <input> 태그를 벗어나면
	    	//console에 로그가 표시 됨
	        console.log("Text changed! : " + $(this).val());
	    });
	});
</script>
</head>
<body>
	<h2>Change method test...</h2>
	<input type="text" value="Hello World" />
	
</body>

</html>
