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
		    var DOM = document.getElementsByClassName("greatgp");
		    $(".child").parentsUntil(DOM, "ul")
		    .css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body class="ancestors"> body (great-great-grandparent)
	<div style="width:500px;" class="greatgp">div (great-grandparent)
		<ul>ul (grandparent)  
			<li>li (direct parent)
				<span class="child">span</span>
			</li>
		</ul>   
	</div>
	<button>실행</button>
</body>
</html>
