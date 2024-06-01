<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* nth 관련 선택자
	순서적으로 선택함
	*/
	$(function(){
		$("#nth-child").click(function(){
			//처음부터 시작하여 부모의 유형에 관계없이 'n'번째 자식인 요소를 선택
       		$("p:nth-child(3)").css("background-color", "yellow");
	    });
	    $("#nth-of-type").click(function(){
	    	//<p> 태그에 대해서 부모 중 'n' 번째 자식인 요소를 선택
	         $("p:nth-of-type(3)").css("background-color", "yellow");
		});
		$("#nth-last-child").click(function(){
			//마지막 자식으로부터 세어 부모의 유형에 관계없이 'n'번째 자식인 요소를 선택
			//단, <p> 태그여야 함(필수)
	        $("p:nth-last-child(3)").css("background-color", "yellow");
		});
		$("#nth-last-of-type").click(function(){
			//<p> 태그에 대해서 부모 중 'n'번째 자식인 요소를 마지막 자식부터 세어 선택
	        $("p:nth-last-of-type(3)").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<div>
		<img src="/images/ch09_18_01.jpg" />
	</div>
	<h1>body에 있는 heading..</h1>
	<p>body의 첫 번째 단락...</p>
	<p>body의 두 번째 단락...</p>
	<div style="border:1px solid;">
		<span>div의 span 요소..</span>
		<p>div의 첫 번째 단락...</p>
		<p>div의 두 번째 단락...</p>
		<p>div의 마지막(세 번째)첫 번째 단락..</p>
	</div><br>
	<div style="border:1px solid;">
		<p>다른 div의 첫 번째 단락...</p>
		<p>다른 div의 두 번째 단락..</p>
		<p>다른 div의 세 번째(마지막) 단락..</p>
	</div>
	<p>body의 세 번째(마지막)단락...</p>
	<button id="nth-child">nth-child</button>
	<button id="nth-of-type">nth-of-type</button>
	<button id="nth-last-child">nth-last-child</button>
    <button id="nth-last-of-type">nth-last-of-type</button><br><br>
</body>
</html>
