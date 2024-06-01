<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//함수를 사용하여 선택한 요소를 새 내용으로 바꿈
	//함수의 실행 결과에 의해 반환된 값이 변경될 새로운 내용이 됨
	$(function(){
	    $("button").click(function(){
	        $("p").replaceWith(function(n){
	            return "<h3>This element has index " 
	            	+ n + ".</h3>";
	        });
	    });
	});
</script>
</head>
<body>
	<h3>This is a heading</h3>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Replace each p element</button>





</body>
</html>
