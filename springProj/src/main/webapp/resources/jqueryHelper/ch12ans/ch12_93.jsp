<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<style>
.descendants * { 
    display: block;
    border: 2px solid orange;
    color: blue;
    padding: 5px;
    margin: 15px;
}
</style>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		$("button").click(function(){
			//nextUntil() 메서드는 다음 일반 형식의 selector와 stop 사이에 있는
			//	모든 다음 형제 요소를 반환함
			//두 매개변수가 모두 비어 있으면 이 메서드는 다음 모든 형제 요소를 반환
			//	(nextAll() 메서드와 동일)
			//여러 형제를 반환하려면 각 표현식을 쉼표로 구분하여야 함
			//<li>의 클래스 이름이 start인 다음부터 시작하여
			//	<li> 요소의 클래스가 stop인 요소까지 검색
	    	$("li.start").nextUntil("li.stop")
	    	.css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body>
	<div style="width:500px;" class="siblings">
		<ul>ul (parent)  
			<li>li (the previous sibling of "start")</li>
			<li class="first">li (the previous sibling of "start")</li>
			<li class="start">li (sibling)</li>
			<li>li (the next sibling of "start")</li>
			<li class="first">li (the next sibling of "start")</li>
            <li class="stop">li (sibling with class name "stop")</li>
            <li class="second">li (the next sibling of "start")</li>
		</ul>
	</div>
	<button>실행</button>
</body>
</html>
