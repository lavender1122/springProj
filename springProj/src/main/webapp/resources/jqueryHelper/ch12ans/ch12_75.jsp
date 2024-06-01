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
		//filter 매개변수를 사용하여 <div> 직접 자손 중에서 클래스 이름이
		//	first인 모든 <p> 요소를 반환
		$("button").click(function(){
    		$("div").children("p.first")
    		.css({"color": "green", "border": "2px solid green"});
		});
	});
</script>
</head>
<body>
	<div class="descendants" style="width:500px;">div (current element) 
		<p class="first">p (child)
	    	<span>span (grandchild)</span>     
		</p>
		<p class="second">p (child)
			<span>span (grandchild)</span>
		</p> 
	</div>
	<button>Add classes to elements</button>
</body>
</html>
