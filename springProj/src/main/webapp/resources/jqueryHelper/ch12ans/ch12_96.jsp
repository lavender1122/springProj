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
			//두 매개변수 모두에서 DOM 사용
			//선택기와 두 매개변수 대신 DOM 요소를 사용하여 두 매개변수 사이의
			//	다음 형제 검색을 필터링함
			//DOM 메소드인 getElementsByClassName()을 사용하여
			//	필터 매개변수 값을 지정하여 nextUntil() 메서드의 stop 매개변수로 사용함		
		    var DOM = document.getElementsByClassName("li.stop");
			//필터 매개변수가 first이므로 <li>의 클래스 이름이 start인 요소와
			//	클래스 이름이 stop인 <li>요소 사이에 있는 요소 중에서
			//	클래스 이름이 first인 요소를 선택함
		    $("li.start").nextUntil(DOM, ".first")
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
            <li class="second">li (the next sibling of "second")</li>
		</ul>
	</div>
	<button>실행</button>
</body>
</html>
