<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//함수를 사용하여 선택한 요소에 대해 토글되어야 하는 클래스 이름을 지정함
	$(function(){
	    $("button").click(function(){
	    	//함수에 사용된 매개변수 n은 <li> 요소의 인덱스.
	    	//toggleClass()의 매개변수 값은 함수에 의해 반환된 값임	    	
	        $("li").toggleClass(function(n){
	        	//return 되는 listitem_+n의 값이 1과 3이면
	        	//17번 스타일이 적용됨. 
	        	//0과 2이면 18번 스타일이 적용됨
	            return "listitem_" + n;
	        });
	    });
	});
</script>
<style>
	.listitem_1, .listitem_3 { color: red;  }
	.listitem_0, .listitem_2 { color: blue;  }
</style>
</head>
<body>
	<h1>This is a heading</h1>
	<ul>
		<li>Peter</li>
		<li>Lois</li>
		<li>Chris</li>
		<li>Stewie</li>
	</ul>
	<button>Add/remove classes</button>





</body>
</html>
