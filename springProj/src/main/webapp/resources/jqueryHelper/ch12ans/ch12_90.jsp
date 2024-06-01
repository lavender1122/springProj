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
		//선택된 요소의 다음 모든 형제를 선택함
		//<li> 요소 중에서 클래스 이름이 start인 요소의 형제 중에서 다음 요소를 모두 선택
    	$("li.start").nextAll()
    	.css({"color": "red", "border": "2px solid green"});
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
</div>
</body>
</html>
