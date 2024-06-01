<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	$(function(){
		$("#lang").click(function(){
			// :lang() 선택자는 language 속성이 지정된 값으로
			// 시작하는 모든 요소를 선택.
			// language 속성 값은 lang="en"과 같이 혼자이거나 
			// lang="en-us"와 같이 하이트(-)이 올 수 있는 전체 단어임
			// <p> 태그의 language 속성 값을 it로 정의하였고,
			// 이 요소를 선택 함
	        $("p:lang(it)").css("background-color", "red");
		});
		$("#root").click(function(){
			// :root 선택자는 문서의 루트 요소를 선택
			// HTML에서 루트 요소는 항상 <html> 요소임
			$(":root").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<p>I live in Italy.</p>
	<p lang="it">Ciao bella!</p>
	<button id="lang">lang</button>
    <button id="root">root</button>
</body>
</html>
