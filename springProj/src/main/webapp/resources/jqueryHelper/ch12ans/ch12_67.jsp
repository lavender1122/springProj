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
		  //parentsUntil() 메서드의 매개변수에 "div, ul"을 사용하여
		  //<span> 상위 요소 중에서 <div> 까지의 요소를 선택하는데
		  //그 중에서 <ul> 요소만을 선택함
	      $("span").parentsUntil("div", "ul")
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
