<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		//event.delegateTarget.nodeName : BUTTON
		//event.currentTarget.nodeName : BUTTON
	    $("button").on("click", function(event){
			$("p").text("delegateTarget returns: " 
					+ event.delegateTarget.nodeName 
					+ " currentTarget returns: " 
					+ event.currentTarget.nodeName);
	    });
	});
</script>
</head>
<body>
	<h3>Show the same(delegateTarget and currentTarget)</h3>
	<button>Test the same</button>
    <p></p>
</body>
</html>
