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
			//두 매개변수를 사용하여 두 매개변수 사이의 다음 형제 요소 검색을
			//	필터링함
			//<li> 클래스 이름이 start인 다음부터 시작하여
			//	<li> 요소의 클래스가 stop인 요소까지 검색
			//	여기에서 클래스 이름이 first인 요소만 검색
	        $("li.start").nextUntil("li.stop", ".first")
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
