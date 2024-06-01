<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* only 관련 선택자
	유일성을 고려한 선택자
	*/
	$(function(){
		$("#only-child").click(function(){
			//자식이 유일한 요소를 선택
		    $("p:only-child").css("background-color", "yellow");
		});
		$("#only-of-type").click(function(){
			//부모 중 그 타입의 유일한 자식인 요소를 선택.
			//자식 노드에 <p> 외에 <span>가 있어도 해당 요소를 선택함
			$("p:only-of-type").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<div>
		<img src="/images/ch09_21_01.jpg" />
	</div>
	<div style="border:1px solid;">
		<p>The first child.</p>
		<p>The last child.</p>
	</div><br>
	<div style="border:1px solid;">
		<p>The only child.</p>
	</div><br>
	<div style="border:1px solid;">
		<span>The first child.</span>
		<p>The last child.</p>
	</div><br>
	<button id="only-child">only-child</button>
    <button id="only-of-type">only-of-type</button>
</body>
</html>
