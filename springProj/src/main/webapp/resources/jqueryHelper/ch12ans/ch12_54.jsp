<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//wrapInner() 메서드 : 지정된 각 요소의 내용(innerHTML) 주위에
	//	지정된 HTML 요소를 래핑함	
	$(function(){
	    $("button").click(function(){
	    	//각 <p> 요소의 내용으로 <b>로 둘러쌓음
	        $("p").wrapInner("<b></b>");
	    });
	});
</script>
</head>
<body>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Wrap a div </button>
</body>
</html>
