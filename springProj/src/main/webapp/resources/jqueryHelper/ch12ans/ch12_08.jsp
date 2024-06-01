<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $("button").click(function(){
	        var x = $("p").offset();
		    $("#demo").text("Top: " + x.top + " Left: " + x.left);
	    });
	});
</script>
</head>
<body>
	<p>This is a paragraph.</p>
	<button>Return the offset coordinates of the p element</button>
    <p id="demo"></p>
</body>
</html>
