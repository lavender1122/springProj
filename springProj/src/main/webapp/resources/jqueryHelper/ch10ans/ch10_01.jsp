<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* click()/dblclick() 이벤트
	마우스 이벤트의 가장 대표적인 경우.
	click() 메서드 : 해당 태그에 마우스를 1번 클릭하면 이벤트 발생
	dblclick() 메서드 : 해당 요소를 더블 클릭하면 실행	
	*/
	$(function(){
	    $("p").click(function(){
	    	//<p> 태그를 클릭하면 이벤트 발생
	    	//선택자로 "this"를 사용하였으므로 자신의 <p> 태그의 내용이 지워짐
	    	//<p> 태그를 클릭할 때마다 지워짐
    	    $(this).hide();
	    });
	});
</script>
</head>
<body>
	<p>If you click on me, I will disappear.</p>
	<p>Click me away!</p>
	<p>Click me too!</p>
</body>

</html>
