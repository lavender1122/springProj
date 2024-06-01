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
		$("button").click(function(){
			//closest() 메서드 : 선택된 요소에서 가장 가까운 조상을 반환
			//현재 요소에서 문서의 루트 요소(<html>)까지 위쪽으로 이동하여
			//	DOM 요소의 가장 가까운 첫 번째 조상을 찾음
			//<span>에서 시작하여 조상 중에서 가장 근접한 <ul> 요소를 검색함
			//	결과에서 첫 번째 조상은 <li>이지만 <ul>을 찾기 때문에 더 상위 조상을 찾음
	    	$("span").closest("ul")
	    	.css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body class="ancestors">body (great-great-grandparent)
	<div style="width:500px;">div (great-grandparent)
    	<ul id="dom">ul (second ancestor - second grandparent) 
		    <ul>ul (first ancestor - first grandparent)
				<li>li (direct parent)
					<span>span</span>
				</li>
			</ul>
		</ul>   
	</div>
	<button>실행</button>
</body>
</html>
