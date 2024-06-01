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
	//필터 매개변수를 사용하여 각 <span>의 직접 조사(부모) 중에서
	// <li>인 요소의 CSS 속성을 변경함
	$(function(){
		$("button").click(function(){
			//parent()의 매개변수에 <li>를 지정함으로써 <span>의 부모 중에서
			//	<li> 요소만을 선택하여 CSS를 변경함
		    $("span").parent("li")
		    .css({"color": "red", "border": "2px solid green"});
		});
	});		
</script>
</head>
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
	<button>Add classes to elements</button>
</body>
</html>
