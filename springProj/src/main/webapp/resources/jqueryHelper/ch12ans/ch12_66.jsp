<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<style>
.ancestors * { 
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
		$("button").on("click",function(){
			//두 매개변수를 사용하여 <span>과 <div> 사이의 특정 요소에 대한
			//검색을 필터링(selector와 stop 사이의 모든 조상 요소를 반환)
		    $("span").parentsUntil("div")
		    .css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body class="ancestors"> body (great-great-grandparent)
	<div style="width:500px;">div (great-grandparent)
		<ul>ul (grandparent)  
			<li>li (direct parent)
				<span>span</span>
			</li>
		</ul>   
	</div>
	<button>실행</button>
</body>
</html>
