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
			//next() 메서드는 선택한 요소의 다음 형제 요소를 반환함
			//	이 메서드는 DOM 요소의 다음 형제를 따라 이동함
			//next() 메서드와 유관한 메서드는 nextAll()과
			//	nextUntil() 메서드가 있음
			//nextAll() 메서드 : 선택한 요소의 다음 형제 요소를 모두 반환
			//nextUntil() 메서드 : 주어진 주 매개변수 사이에 있는 
			//	모든 다음 형제 요소를 반환함
			//<li> 요소 중에서 클래스 이름이 start인 요소의 형제 다음에 오는 요소를 선택함
	    	$("li.start").next()
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
		</ul>
		<button>실행</button>
</div>
</body>
</html>
