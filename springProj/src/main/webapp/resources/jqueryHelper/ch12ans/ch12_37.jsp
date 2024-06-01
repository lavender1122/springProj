<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//<li> 요소 중에서 함수로 return된 함수 값에 의해 클래스를 제거함
	        $("li").removeClass(function(n) {
	        	//인덱스가 0 또는 1인 <li> 요소의 클래스
	        	//	listitem을 return하여 함수 값이 됨
		        if (n==0||n==1) {return "listitem"}
    	    		else {return ""}
		    });
		});
	});
</script>
<style>
	.listitem { color:red; }
</style>
</head>
<body>
	<h1>This is a heading</h1>
	<ul>
		<li class="listitem">Peter</li>
		<li class="listitem">Lois</li>
		<li class="listitem">Chris</li>
		<li class="listitem">Stewie</li>
	</ul>
	<button>Remove class</button>




</body>
</html>
