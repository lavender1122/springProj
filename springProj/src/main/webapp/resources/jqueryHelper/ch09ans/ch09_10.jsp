<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
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
	$(function(){
	    $("button").click(function(){
	    	//형제 선택자는 플러스 기호(+) 외에 물결표(~)를 사용하여 같은 레벨에 해당하는
	    	//1개 이상의 태그를 선택하기도 함.
	    	//<a> 태그 다음에 오는 모든 <p> 태그를 선택함
	    	//2번의 형제인 모든 <p>를 선택하여 3번과 4번을 선택함
	        $("a~p").css({"color": "green", "border": "2px solid green"});
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
