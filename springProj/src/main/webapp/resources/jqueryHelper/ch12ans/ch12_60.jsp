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
			//검색 범위를 더욱 축소함. <li> 요소 중에서 클래스 이름이 first인
			//	부모만을 반환
			//parent의 매개변수 li.first를 지정함으로써 <span>의 부모의
			//	li 요소 중에서 클래스 이름이 first인 요소만을 선택하여 CSS를 변경함
	        $("span").parent("li.first")
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
