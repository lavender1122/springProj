<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//함수를 사용하여 선택한 요소에 클래스를 추가
	    	//함수의 매개변수 "n"은 인덱스.
	    	//<p>태그의 첫 번째 요소의 인덱스는 0이며,
	    	//더 번째 요소는 인덱스가 1이 됨
	        $("p").addClass(function(n){
	        	//return 값으로 par_0과 par_1이 각각 반환됨
	            return "par_" + n;
	        });
	    });
	});
</script>
<style>
	.par_0 {
	    color: blue;
	}
	.par_1 {
	    color: red;
	}
</style>
</head>
<body>
	<h1>This is a heading</h1>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Add classes to p elements</button>


</body>
</html>
