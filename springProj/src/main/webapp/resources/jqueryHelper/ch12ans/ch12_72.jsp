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
			//자기 자신 <span> 요소를 반환
			//closest()메서드는 자기 자신부터 시작하므로 
			//	<span>이 반환됨
	    	$("span").closest("span")
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
