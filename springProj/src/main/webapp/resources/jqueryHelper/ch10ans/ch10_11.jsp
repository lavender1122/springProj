<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* keydown() / keyup() 메서드
	1. keydown() 이벤트 : 키보드에서 key를 누르면 발생 함
	2. keyup() 이벤트 : 키보드에서 손을 떼면 발생 함
	
	keydown : 키가 내려가고 있음
	keypress : 키를 누름
	keyup : 키 누름을 해제함
	*/
	$(function(){
	    $("input").keydown(function(){
	    	//<input> 태그 내의 텍스트 창에 임의의 키를 누르는 순간
	    	//배경 색상이 노란색으로 변함
	        $("input").css("background-color", "yellow");
	    });
	    $("input").keyup(function(){
	    	//<input> 태그 내의 택스트 창의 임의의 키를 놓으면 
	    	//배경 색상이 핑크색으로 변함
	        $("input").css("background-color", "pink");
	    });
	});
</script>
</head>
<body>
	Enter your name: <input type="text" />
</body>

</html>
