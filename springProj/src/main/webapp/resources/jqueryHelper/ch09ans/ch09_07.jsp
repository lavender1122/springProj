<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<style>
.test * { 
    display: block;
    border: 2px solid orange;
    color: blue;
    padding: 5px;
    margin: 15px;
}
</style>
</head>
<body>
<script>
	/* 노드 선택자
	DOM(Document Object Model) 노드는 트리 구조를 가지며, 선택된 요소를
	기분으로 다른 노드와의 가족 관계를 형성함. 이들 관계를 중심으로 해당 노드를 
	선택자로 지정하여 요소를 선택할 수 있음
	*/
	/* 자손 선택자
	자손은 선택된 노드의 모든 하위 노드가 해당됨
	$("요소 이름A 요소 이름B").실행_함수();
	
	일반 형식이 그룹 선택자와 유사하지만 콤마(,)로 구분되지 않으며,
	그룹 선택자에서는 여러 개 인수가 올 수 있는 반면 자손 선택자는 2개의 인수만 올 수 있음
	*/
	$(function(){
	    $("button").click(function(){
	    	//<div>의 자손 중에서 <a>만을 선택하도록 함
	        $("div a").css({"color": "green", "border": "2px solid green"});
	    });
	});
</script>
	<h2>노드 선택자</h2>
	<p>
		<img src="/images/ch09_07_01.jpg" />
	</p>
	<h2>노드 관계 그림</h2>
	<p>
		<img src="/images/ch09_07_02.jpg" />
	</p>
	<p>
		<em>div를 선택자(기준)로 판단하였을 때 a, p, p 요소를 자식으로 갖고,
			span, a, span을 손자로 갖음
		</em>
	</p>
	<div class="test">
		<a href="#"> a1 Tag </a>
        <p>p (child)
	    	<span>span 1</span>   
            <a href="#"> a2 Tag </a> 
		</p>
		<p>p (child)
			<span>span 2</span>
		</p> 
	</div>
	<button>Click me</button>
</body>
</html>
