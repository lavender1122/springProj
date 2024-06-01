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
			//필터 매개변수를 사용하여 <span>의 <li> 요소와 <div> 요소의
			//	모든 조상을 반환
		    $("span").parents("div, li")
		    .css({"color": "red", "border": "2px solid green"});
		});
});
</script>
</head>

<body class="ancestors">body (great-great-grandparent)
	<div class="ancestors">
		<div style="width:500px;">div (great-grandparent)
			<ul>ul (grandparent)  
				<li class="first">li (direct parent)
					<span>span01</span>
				</li>
                <li class="second">li (direct parent)
					<span>span02</span>
				</li>
			</ul>   
		</div>         
        <div style="width:500px;">div (great-grandparent)           
			<p>p (direct parent)
				<span>span03</span>
			</p> 
		</div>
	</div>
</body>
	<button>Add classes to elements</button>
</body>
</html>
