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
	/* 자식 선택자
	자식은 선택 요소의 바로 하위 노드만을 의미함
	자손과 자식의 개념을 혼동하지 말자
	*/
	$(function(){
	    $("button").click(function(){
	    	//<div> 태그 자식(자손이 아님) 중에서 <p> 요소만을 선택
	        $("div > p").css({"color": "green", "border": "2px solid green"});
	    });
	});
</script>
	<h2>노드 관계 그림</h2>
	<p>
		<img src="/images/ch09_07_02.jpg" />
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
