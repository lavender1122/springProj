<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	        return "Hello world!";
	    });
	    $("button").click(function(event){
	        $("p").html(event.result);
	    });  
	});
</script>
</head>
<body>
	<button>Display event.result</button>
	<p>This is a paragraph.</p>

</body>
</html>
