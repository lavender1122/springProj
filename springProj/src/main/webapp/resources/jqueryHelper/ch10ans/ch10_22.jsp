<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* one() 메서드
	선택한 요소에 대해 하나 이상의 이벤트 처리기를 연결하고
	이벤트가 발생할 때 실행할 함수를 지정하며
	이벤트 처리기 함수는 각 요소에 대해 1번만 실행됨
	*/
	$(function(){
		//<p>요소를 클릭할 때 <p>요소의 텍스트 크기를 6px만큼 크게 함
		//on() 메서드의 경우 클릭을 반복하면 텍스트의 크기가 계속 5px만큼 커지는데
		//one() 메서드는 단 한 번만 적용됨
//     	$("p").on("click", function(){
    	$("p").one("click", function(){
	        $(this).animate({fontSize: "+=6px"});
	    });
	});
</script>
</head>
<body>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
</body>

</html>
