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
	/* 형제 선택자
	형제 관계는 자신과 동일한 레벨에 있는 노드들임
	형제 선택자는 플러스 문자(+)를 사용하여 같은 레벨에서 다음에 오는 1개의 태그를 선택함
	*/
	$(function(){
	    $("button").click(function(){
	    	//<a> 태그 바로 다음에 오는 형제 <p> 태그를 선택함
	    	//a+p+p : 2번의 형제인 <p>를 선택하고 바로 다음에 오는 3번을 선택함
	        $("a+p").css({"color": "green", "border": "2px solid green"});
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
