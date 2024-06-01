<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
</script>
<script>
	// :has() 선택자는 내부에 하나 이상의 요소가 있고
	// 지정된 선택자와 일치하는 모든 요소를 선택
	// 내부에 여러 요소가 있는 요소를 선택하려면 쉼표를 사용하여 구분
	$(function(){
		$("#has").click(function(){
			//div 태그 안에서 <p>, <span>, <li> 중 하나라도 포함한 <div>태그를 선택 함
		    $("div:has(p, span, li)").css("border", "solid red");
		});
	});
</script>
</head>
<body>
	<div>
		<p>
			This is a paragraph inside a div element.
			<br />
			<span>This is a span element</span>
		</p>
		<li>This is a list item inside a div element</li>
	</div>
	<br />
	<div>
	    <div>This is a list item inside a div element</div>
	</div>
	<div>
	    This is a list item inside a div element
	</div>
	<div>
	    <b>This is a list item inside a div element</b>
	</div>
	<div>
		<li>This is a list item inside a div element</li>
	    <b>This is a list item inside a div element</b>
	</div>
    <br />
	<button id="has">has</button>
</body>
</html>
