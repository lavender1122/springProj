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
			//parent() 메서드는 선택된 요소의 직접적인 부모 요소를 반환
			//DOM 트리의 하나의 상위 레벨을 찾아감
			//조부모 또는 다른 조상을 반환하기 위해 문서의 루트 요소까지 이동하려면
			//	parents() 또는 parentsUntil() 메서드를 사용함
			//<span> 태그 입장에서 parent에 해당하는 스타일 속성(CSS)
			//	을 변경하여 출력
    		$("span").parent()
    		.css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body>
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
        <div style="width:500px;"> div(great-grandparent)
			<p>p (direct parent)
				<span>span</span>
			</p> 
		</div>
	</div>
	<button>Add classes to elements</button>
</body>
</html>
