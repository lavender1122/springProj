<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//속성 border-width의 값을 함수로 받음
	        $("p").css("border-width", function(i){
	        	//return 문에 의해 함수 값을 반환함
	        	//1 + 25
		        return i + 25;
	        });
	    });
	});
</script>
</head>
<body>
	<button>Change the border-width</button>
	<p style="border: 1px solid black;">This is a paragraph.</p>

</body>
</html>
