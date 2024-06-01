<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $("button").click(function(){
        	newPos = new Object();
	        newPos.left = "100";
	        newPos.top = "100";
	        $("p").offset(newPos);
	    });
	});
</script>
</head>
<body>
	<p>This is a paragraph.</p>
	<button>Using an object</button>
</body>
</html>
