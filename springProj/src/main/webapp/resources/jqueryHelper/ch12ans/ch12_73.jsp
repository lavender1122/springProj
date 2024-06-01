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
    	var listItemII = document.getElementById("dom");
    	
    	$("button").click(function(){
		    $("li").closest("ul",listItemII)
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
