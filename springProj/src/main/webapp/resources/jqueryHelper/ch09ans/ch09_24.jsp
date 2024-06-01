<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* [attribute = value], [attribute != value] 선택자
	[attribute = value] => 지정된 속성과 값을 가진 각 요소를 선택
	[attribute != value] => 지정된 속성 및 값을 갖지 않는 각 요소를 선택.
					즉, 선택된 속성에 대한 값이 다른 요소가 선택됨
	*/
	$(function(){
		$("#is").click(function(){
			//id 속성 값이 "choose"인 요소를 선택
	        $("[id=choose]").css("background-color", "yellow");
		});
		$("#is_not").click(function(){
			//태그 <p> 중에서 class 속성 값이 "intro"가 아닌 요소를 선택
			$("p[class!='intro']").css("background-color", "red");
		});
	});
</script>
</head>
<body>
	<p class="intro">I live in Italy.</p>
	<p lang="it">Ciao bella!</p>
    <ul id="choose">
		<li>Goofy</li>
		<li>Mickey</li>
		<li>Pluto</li>
	</ul>
	<button id="is">태그와 값이 같음</button>
    <button id="is_not">태그와 값이 다름</button>
</body>
</html>
