<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("#btn01").click(function(){
	    	//<h1> 요소를 <p> 요소 뒤에 삽입
	    	//appendTo = insertAfter
	         $("h1").appendTo("p");
	    });
		$("#btn02").click(function(){
			//<h1> 요소를 <p> 요소 앞에 삽입
			//prependTo = insertBefore()
	         $("h1").prependTo("p");
	    });
	});
</script>
</head>
<body>


</script>
</head>
<body>
	<button id="btn01">Insert after element </button>
    <button id="btn02">Insert before element </button>
    <h1>This is a heading</h1>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>

</body>
</html>
