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
			//parent() 메서드는 선택된 요소의 모든 조상 요소를 문서의 루트 요소(<html>)까지
			//반환함. 조상은 부모, 조부모, 증조부모 등을 의미함
		    $("span").parents()
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
