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
			//<span>과  <body> 사이에 여러 조상을 반환
			//parentsUtil() 메서드는 콤마에 의해 구분된 "p, li, div" 필터를
			//사용하여 <span>에서 <body>까지 상위 요소 중에서
			//<p>, <li>, <div>를 선택함
		      $("span").parentsUntil("body", "p, li, div")
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
