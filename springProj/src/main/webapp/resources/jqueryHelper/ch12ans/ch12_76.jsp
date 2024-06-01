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
			//<div> 자손 중에서 모든 <p> 요소를 선택
			//	<p> 요소가 아닌 것이 있다면 선택되지 않음
	    	$("div").children("p").css("background-color", "yellow");
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
	<button>실행</button>
</body>
</html>
