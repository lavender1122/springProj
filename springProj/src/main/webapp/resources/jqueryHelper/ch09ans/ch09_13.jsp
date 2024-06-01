<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* first-of-type 선택자
	:first-of-type => 특정 유형의 부모 중 첫 번째 자식인 모든 요소를 선택함
	 :last-of-type => 특정 유형의 부모 중 마지막 자식인 모든 요소를 선택함
	*/
	$(function(){
	    $("button").click(function(){
	    	//**p태그가 첫번째여야 함(필수)
// 	    	$("p:first-child").css("background-color", "yellow");
	    	
	    	//**p태그 중에서 첫번째이면 됨(선택)
       		$("p:first-of-type").css("background-color", "yellow");
	    });
	});
</script>
</head>
<body>
	<h2>This is a heading</h2>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Click me</button>
</body>
</html>
